importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyD33Bm4vifZhm5Kb1vdXLDcNa_oOebUTH8",
  authDomain: "mytrust-d776f.firebaseapp.com",
  databaseURL: "https://mytrust-d776f-default-rtdb.firebaseio.com",
  projectId: "mytrust-d776f",
  storageBucket: "mytrust-d776f.firebasestorage.app",
  messagingSenderId: "413904495715",
  appId: "1:413904495715:web:37dbc846458fa412398456",
  measurementId: "G-3QWH2553X1"
});

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});