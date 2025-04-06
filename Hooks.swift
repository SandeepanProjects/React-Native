//
//  Hooks.swift
//  
//
//  Created by Apple on 06/04/25.
//


### 1. **What are hooks?**
Hooks are functions introduced in React 16.8 that allow you to use state and lifecycle methods within functional components, making class components unnecessary for most use cases.

---

### 2. **Why were hooks brought up in React Native?**
Hooks simplify React Native development by:
- Eliminating the need for class components, making code easier to read and maintain.
- Enabling you to reuse stateful logic through **custom hooks**.
- Allowing functional components to access the same powerful features as class components.

---

### 3. **How do hooks replace the lifecycle methods of class components?**
Hooks map directly to lifecycle methods:
- `useEffect` replaces methods like `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount`.
- `useState` manages state, replacing `this.setState` in class components.
- You can control updates and side effects with hooks, removing the need for lifecycle management in class components.

---

### 4. **Explain useState, useEffect, useCallback, useMemo, and useRef**:
- **`useState`**: Manages state in functional components.
  ```javascript
  const [count, setCount] = useState(0);
  ```
- **`useEffect`**: Handles side effects like API calls and subscriptions.
  ```javascript
  useEffect(() => {
      console.log("Effect triggered!");
  }, [dependency]);
  ```
- **`useCallback`**: Memoizes functions to avoid unnecessary re-creations.
  ```javascript
  const memoizedCallback = useCallback(() => {
      console.log("Callback triggered!");
  }, [dependency]);
  ```
- **`useMemo`**: Memoizes values for performance optimization.
  ```javascript
  const memoizedValue = useMemo(() => calculateValue(), [dependency]);
  ```
- **`useRef`**: Creates a reference to a DOM or React element, persisting across renders.
  ```javascript
  const inputRef = useRef(null);
  ```

---

### 5. **Difference between useEffect and useLayoutEffect**:
- `useEffect`: Runs asynchronously **after the render is completed** (ideal for side effects like API calls).
- `useLayoutEffect`: Runs synchronously **before the browser paints** (useful for DOM-related tasks to prevent flickering).

---

### 6. **What are the rules while using hooks in React Native?**
Hooks must follow these rules:
1. **Only call hooks at the top level** (not inside loops, conditions, or nested functions).
2. **Only call hooks inside React functions or custom hooks**, not in regular functions.

---

### 7. **What are custom hooks and how can we create them?**
Custom hooks encapsulate reusable logic. Example:
```javascript
function useCounter() {
    const [count, setCount] = useState(0);
    const increment = () => setCount(count + 1);
    return { count, increment };
}
```
Use it like:
```javascript
const { count, increment } = useCounter();
```

---

### 8. **How can you update the current state value based on the previous state value in React hooks?**
You can update state using a function:
```javascript
setCount(prevCount => prevCount + 1);
```
This ensures you always work with the latest state value.

---

### 9. **What are the differences in using hooks and state management in class components in React Native?**
| **Aspect**        | **Hooks**                               | **Class Components**                  |
|--------------------|------------------------------------------|----------------------------------------|
| **Ease of Use**    | Simpler, more readable, and modular      | Requires more boilerplate code         |
| **Lifecycle**      | Managed with hooks like `useEffect`     | Managed with lifecycle methods like `componentDidMount` |
| **State Updates**  | Uses `useState` for state management     | Uses `this.setState` for state updates |
| **Reusability**    | Logic can be reused through custom hooks| Harder to reuse logic across components|

---

If you’d like to explore examples or need clarification, let me know! This topic is rich with possibilities.
