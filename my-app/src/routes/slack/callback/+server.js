import { json } from '@sveltejs/kit';
import axios from 'axios';

export async function GET({ url }) {
    const code = url.searchParams.get("code");
    const clientId = process.env.SLACK_CLIENT_ID;
    const clientSecret = process.env.SLACK_CLIENT_SECRET;
    const redirectUri = process.env.SLACK_REDIRECT_URI;

    if (!code) {
        return json({ error: 'Code parameter is missing' }, { status: 400 });
    }

    try {
        const res = await axios.post('https://slack.com/api/oauth.v2.access', null, {
            params: {
                client_id: clientId,
                client_secret: clientSecret,
                code,
                redirect_uri: redirectUri
            }
        });

        const data = res.data;

        if (data.ok) {
            console.log("✅ Slack bot installed! Access token:", data.access_token);
            return new Response("Success!");
        } else {
            return json({ error: data.error }, { status: 400 });
        }
    } catch (err) {
        console.error("OAuth error:", err);
        return json({ error: 'Slack OAuth failed' }, { status: 500 });
    }
}
