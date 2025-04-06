//
//  Redux.swift
//  
//
//  Created by Apple on 07/04/25.
//

import Foundation

### **1. What is meant by Redux?**
Redux is a **predictable state management library** for JavaScript applications, often used with React and React Native. It centralizes the app’s state in a single **store**, making state management more predictable and testable by enforcing strict unidirectional data flow.

---

### **2. What is meant by Flux?**
Flux is an **application architecture pattern** created by Facebook for building UIs. It complements React by managing unidirectional data flow through actions, dispatchers, stores, and views.

---

### **3. What is the difference between Redux and Flux?**
| **Aspect**            | **Flux**                                           | **Redux**                                      |
|------------------------|----------------------------------------------------|-----------------------------------------------|
| **Architecture**      | Includes multiple stores                           | Uses a single centralized store               |
| **Data Flow**         | Unidirectional but requires developers to manage it| Strictly enforces unidirectional data flow     |
| **Dispatcher**        | Requires a dispatcher to broadcast actions         | No dispatcher; actions are sent directly to reducers |
| **Implementation**    | More flexible but requires more boilerplate code   | Simplified with a consistent structure        |

---

### **4. Core principles of Redux**
1. **Single Source of Truth**: The entire state is stored in one central store.
2. **State is Read-Only**: The state can only be updated through **actions**.
3. **Changes are Made with Pure Functions**: Reducers, which are pure functions, define how the state changes.

---

### **5. Difference between mapStateToProps() and mapDispatchToProps**
- **`mapStateToProps`**: Maps the state from the Redux store to props in a component.
  ```javascript
  const mapStateToProps = (state) => ({
      counter: state.counter,
  });
  ```
- **`mapDispatchToProps`**: Maps dispatch functions to props, allowing components to send actions to the store.
  ```javascript
  const mapDispatchToProps = (dispatch) => ({
      increment: () => dispatch({ type: "INCREMENT" }),
  });
  ```

---

### **6. What are constants?**
Constants are strings that define action types in Redux. They prevent errors caused by typos in action names.
```javascript
export const ADD_TODO = "ADD_TODO";
```

---

### **7. What are reducers?**
Reducers are **pure functions** that take the current state and an action, then return the new state.
```javascript
const counterReducer = (state = 0, action) => {
    switch (action.type) {
        case "INCREMENT":
            return state + 1;
        default:
            return state;
    }
};
```

---

### **8. Explain data flow in a typical application made with React Native and Redux**
1. **Action**: User interaction triggers an action.
2. **Reducer**: The action is sent to the reducer to compute the new state.
3. **Store**: The new state is updated in the Redux store.
4. **View**: The React components are re-rendered based on the updated state.

---

### **9. What is meant by store in Redux?**
The store is a **centralized container** for the app’s state, which allows components to access or update the state.

---

### **10. Name all the Redux store methods**
1. `getState()`: Retrieves the current state.
2. `dispatch(action)`: Dispatches an action to update the state.
3. `subscribe(listener)`: Registers a listener function that gets called on every state change.
4. `replaceReducer(newReducer)`: Replaces the current reducer with a new one (useful for hot reloading).

---

### **11. How to set the initial state in Redux?**
You can set the initial state when creating the store or within a reducer:
```javascript
const initialState = { count: 0 };

const counterReducer = (state = initialState, action) => {
    // Logic here
};
```

---

### **12. What are the workflow features in Redux?**
- **Predictability**: With a centralized store, state updates are predictable.
- **Debugging**: Redux DevTools allow time-travel debugging to observe state changes.
- **Middleware**: Extensible through middleware like Redux Thunk or Redux Saga.

---

### **13. What are Redux forms?**
Redux Forms is a library that integrates form management with Redux, helping manage form data, validation, and state effectively.

---

### **14. What do you understand about the Redux Saga?**
Redux Saga is a middleware library that manages side effects (e.g., asynchronous tasks like API calls) in Redux applications using **generator functions**, making it easier to write complex logic.

---

### **15. Name all Redux store methods**
(Repeated from question 10)
- `getState()`, `dispatch(action)`, `subscribe(listener)`, and `replaceReducer(newReducer)`.

---

### **16. What does “store” mean in Redux?**
The **store** is the heart of a Redux application, where the state tree is maintained. It allows components to subscribe to changes, dispatch actions, and manage application state consistently.
