export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        return res.status(200).end();
    }

    // Lấy ngày, tháng, năm theo giờ chuẩn (UTC/Việt Nam)
    const now = new Date();
    
    // Đảm bảo định dạng 2 chữ số cho Ngày và Tháng
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const year = now.getFullYear();

    // Tạo Key dạng: TLONG-DDMMYYYY (Ví dụ: TLONG-01092026)
    const dailyKey = `TLONG-${day}${month}${year}`;

    return res.status(200).json({
        success: true,
        key: dailyKey
    });
}
