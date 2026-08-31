export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        res.status(200).end();
        return;
    }

    // Thông tin PWF Auth chính xác của bạn
    const APP_ID = "6ff8e0d1-efa2-4686-ae24-8da3e8a94b30";
    const APP_SECRET = "23fbc34f265b6882d752eb20c93188508b7db026cf00c52ac6408cd78d38e408";

    try {
        const response = await fetch("https://pwfauth.com/api/v2/licenses/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "x-app-id": APP_ID,
                "x-app-secret": APP_SECRET
            },
            body: JSON.stringify({
                expiry_seconds: 86400, // Hạn dùng 24 giờ
                note: "Key generated from Linkvertise Get Key System"
            })
        });

        const data = await response.json();

        if (response.ok && (data.key || data.license || (data.data && data.data.key))) {
            const finalKey = data.key || data.license || data.data.key;
            return res.status(200).json({ success: true, key: finalKey });
        } else {
            return res.status(400).json({
                success: false,
                message: data.message || "Không thể khởi tạo Key từ PWF Auth API"
            });
        }
    } catch (error) {
        return res.status(500).json({ success: false, message: "Lỗi kết nối máy chủ PWF Auth", error: error.message });
    }
}
