import crypto from 'crypto';

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(200).end();

    // Ép sang múi giờ Việt Nam (Asia/Ho_Chi_Minh)
    const options = { timeZone: 'Asia/Ho_Chi_Minh', year: 'numeric', month: '2-digit', day: '2-digit' };
    const formatter = new Intl.DateTimeFormat('en-GB', options);
    const parts = formatter.formatToParts(new Date());

    const day = parts.find(p => p.type === 'day').value;
    const month = parts.find(p => p.type === 'month').value;
    const year = parts.find(p => p.type === 'year').value;

    // Chuỗi ngẫu nhiên 4 ký tự đằng sau
    const randomStr = crypto.randomBytes(2).toString('hex').toUpperCase();

    // Kết quả chuẩn theo giờ Việt Nam
    const dailyKey = `TLong-${day}${month}${year}-${randomStr}`;

    return res.status(200).json({ success: true, key: dailyKey });
}
