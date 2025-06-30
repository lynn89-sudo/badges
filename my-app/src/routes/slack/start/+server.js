import { SLACK_REDIRECT_URI, SLACK_CLIENT_ID } from '$env/static/private';

export async function GET() {
    const redirectUri = SLACK_REDIRECT_URI;
    const clientId = SLACK_CLIENT_ID;

    const slackUrl = `https://slack.com/oauth/v2/authorize?client_id=${clientId}&scope=users:read,users:read.email&redirect_uri=${redirectUri}`;

    return new Response(null, {
        status: 302,
        headers: {
            Location: slackUrl
        }
    });
}