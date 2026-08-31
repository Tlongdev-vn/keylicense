import crypto from 'crypto';

export default async function handler(req, res) {
    // Cấu hình CORS
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        return res.status(200).end();
    }

    const BASE_URL = 'https://pwfauth.com';
    const APP_SECRET = '23fbc34f265b6882d752eb20c93188508b7db026cf00c52ac6408cd78d38e408';

    try {
        // Tạo HWID ngẫu nhiên đại diện cho lượt truy cập qua Web
        const randomHwid = 'web-' + crypto.randomBytes(8).toString('hex');

        // Gọi endpoint tạo Free Trial Key theo SDK chính thức
        const response = await fetch(`${BASE_URL}/api/auth/trial.php`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-App-Secret': APP_SECRET,
            },
            body: JSON.stringify({ hwid: randomHwid }),
        });

        const rawText = await response.text();
        let data = {};

        try {
            data = JSON.parse(rawText);
        } catch (e) {
            return res.status(500).json({
                success: false,
                message: 'Non-JSON response from license server.',
            });
        }

        // Kiểm tra kết quả trả về từ PWF Auth Server
        if (data && data.success) {
            const key = data.key || data.license_key || data.license;
            return res.status(200).json({ success: true, key: key });
        } else {
            // Trả lỗi chi tiết từ máy chủ PWF Auth (Ví dụ: TRIAL_DISABLED, TRIAL_LIMIT,...)
            return res.status(400).json({
                success: false,
                message: data.message || `Error code: ${data.error_code || 'UNKNOWN_ERROR'}`,
                code: data.error_code
            });
        }

    } catch (error) {
        return res.status(500).json({
            success: false,
            message: 'Server connection error.',
            error: error.message,
        });
    }
}
