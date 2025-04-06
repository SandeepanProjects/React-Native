//
//  bridges.swift
//  
//
//  Created by Apple on 06/04/25.
//

### 1. **What are bridges in React Native? Why are they used?**
- **Bridges** are the core mechanism that allows React Native to communicate between the JavaScript code and native platforms (iOS and Android). React Native operates on both the **JavaScript thread** and the **native thread**.
- Bridges facilitate this communication by serializing and passing messages back and forth.
**Why they are used**:
- React Native doesn't rewrite the native components but rather integrates them. Bridges enable JavaScript code to invoke native modules, such as accessing device features (camera, GPS, etc.) or executing native UI elements.

---

### 2. **Describe networking in React Native**
Networking in React Native primarily involves making requests to APIs or fetching resources over the internet. React Native supports:
- **Fetch API**: A modern interface for making HTTP requests.
- **XHR (XMLHttpRequest)**: An older networking interface, but still supported.
- **Third-party libraries**: Libraries like Axios or Apollo Client for more advanced use cases (e.g., REST APIs or GraphQL).

---

### 3. **How to make AJAX network calls in React Native?**
You can use the **Fetch API** or libraries like Axios to make AJAX calls.
**Example with Fetch API**:
```javascript
import React, { useState, useEffect } from 'react';
import { Text, View } from 'react-native';

function MyComponent() {
    const [data, setData] = useState(null);

    useEffect(() => {
        fetch('https://jsonplaceholder.typicode.com/posts/1')
            .then(response => response.json())
            .then(json => setData(json))
            .catch(error => console.error(error));
    }, []);

    return (
        <View>
            <Text>{data?.title || "Loading..."}</Text>
        </View>
    );
}

export default MyComponent;
```

You can also use **Axios**:
```javascript
import axios from 'axios';

axios.get('https://jsonplaceholder.typicode.com/posts/1')
    .then(response => console.log(response.data))
    .catch(error => console.error(error));
```

---

### 4. **What is the use of the XHR module in React Native?**
- The **XHR module** (XMLHttpRequest) in React Native enables making HTTP requests, primarily for compatibility with older APIs and services.
- Although the Fetch API is preferred, XHR is still helpful for some legacy use cases or when you need finer control over request handling (like progress tracking).

---

If you'd like examples for more advanced networking or additional explanation on any topic, let me know! I'm here to help clarify concepts.
