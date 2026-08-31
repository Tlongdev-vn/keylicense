import crypto from 'crypto';

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(200).end();

    const now = new Date();
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const year = now.getFullYear();

    // Tạo 4 ký tự ngẫu nhiên ngẫu nhiên (chữ + số)
    const randomStr = crypto.randomBytes(2).toString('hex').toUpperCase();

    // Kết quả dạng: TLONG-01092026-A8F2
    const dailyKey = `TLONG-${day}${month}${year}-${randomStr}`;

    return res.status(200).json({ success: true, key: dailyKey });
}
