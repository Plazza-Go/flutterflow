const functions = require('firebase-functions');
const admin = require('firebase-admin');
const cors = require('cors')({ origin: true });

admin.initializeApp();

// Define your Cloud Function with proper CORS handling
exports.catchMeCors = functions.https.onRequest(async (request, response) => {
    // Handle the CORS request
    cors(request, response, async () => {
        try {
            console.log(request.body);
            // You can process the request body here
            response.send({ message: 'Request processed successfully' });
        } catch (error) {
            console.error('Error processing request:', error);
            response.status(500).send({ error: 'Internal Server Error' });
        }
    });
});