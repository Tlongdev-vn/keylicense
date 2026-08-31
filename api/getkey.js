export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Credentials', true);
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        return res.status(200).end();
    }

    const APP_ID = "6ff8e0d1-efa2-4686-ae24-8da3e8a94b30";
    const APP_SECRET = "23fbc34f265b6882d752eb20c93188508b7db026cf00c52ac6408cd78d38e408";

    const endpoints = [
        "https://pwfauth.com/api/v2/licenses/create",
        "https://pwfauth.com/api/v1/licenses/create",
        "https://pwfauth.com/api/licenses/create",
        "https://pwfauth.com/api/v2/keys/create"
    ];

    for (const url of endpoints) {
        try {
            const response = await fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "x-app-id": APP_ID,
                    "x-app-secret": APP_SECRET,
                    "Authorization": `Bearer ${APP_SECRET}`
                },
                body: JSON.stringify({
                    expiry_seconds: 86400,
                    duration: 86400,
                    days: 1,
                    note: "Linkvertise Key"
                })
            });

            if (response.ok) {
                const data = await response.json();
                const key = data.key || data.license || data.code || (data.data && data.data.key);
                if (key) {
                    return res.status(200).json({ success: true, key: key });
                }
            }
        } catch (e) {
            // Continue trying next endpoint
        }
    }

    return res.status(400).json({ 
        success: false, 
        message: "Failed to generate key. Please check App ID/Secret on Admin Panel!" 
    });
}
