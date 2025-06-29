//
//  lifecycle.swift
//  
//
//  Created by Apple on 07/04/25.
//

In React Native (and React in general), the lifecycle refers to the sequence of events or phases that a component goes through from its creation to its destruction. Understanding the lifecycle helps you manage things like fetching data, handling events, and cleaning up resources when a component is no longer needed.

In class components, React provides specific lifecycle methods to handle each phase of the component's lifecycle. However, in functional components (with hooks), React provides hooks like `useEffect` to manage similar behavior. Below is an explanation of the React lifecycle, both for class components and functional components.

---

### **Lifecycle in Class Components**

In class components, the lifecycle can be divided into three main phases: **Mounting**, **Updating**, and **Unmounting**. These phases correspond to specific lifecycle methods.

#### **1. Mounting (Component Creation)**
This is the phase when the component is being created and inserted into the DOM.

- **`constructor(props)`**: This method is called when a component is first created. It is typically used to initialize state and bind methods.
  
- **`static getDerivedStateFromProps(nextProps, nextState)`**: Called right before rendering, both on the initial mount and when updating. It’s used to update state based on props changes. This method is rarely needed, and you generally use it for special cases.

- **`render()`**: This method is required and returns the JSX that describes what should appear on the screen. It is called during mounting and re-rendering.

- **`componentDidMount()`**: Called once the component has been rendered and inserted into the DOM (or screen in React Native). This is where you can initiate API calls, set up subscriptions, or perform other tasks that require access to the DOM or component.

#### **2. Updating (State or Props Change)**
When state or props change, React will re-render the component. The following lifecycle methods are called in this phase.

- **`static getDerivedStateFromProps(nextProps, nextState)`**: As mentioned, this is called before every render (when props or state change).

- **`shouldComponentUpdate(nextProps, nextState)`**: This method is used to control whether or not a component should re-render. It returns a boolean. You can use this to optimize performance (e.g., avoid unnecessary renders when props and state haven't changed).

- **`render()`**: As with the mounting phase, `render` is called to determine what to display based on state and props.

- **`getSnapshotBeforeUpdate(prevProps, prevState)`**: This method is called right before React applies changes to the DOM. It can be used to capture some information (like scroll position) before the DOM is updated.

- **`componentDidUpdate(prevProps, prevState, snapshot)`**: This method is called after the component has been updated in the DOM. It is useful for performing network requests or operations based on changes in state or props.

#### **3. Unmounting (Component Removal)**
This is the phase when the component is being removed from the DOM.

- **`componentWillUnmount()`**: Called just before the component is removed from the screen. This is where you should clean up subscriptions, cancel API requests, or clear any timers.

---

### **Lifecycle in Functional Components (with Hooks)**

With the introduction of hooks, functional components can now handle the same lifecycle behavior as class components. The primary hook for managing lifecycle events in functional components is `useEffect`.

#### **1. Mounting**

In functional components, the mounting phase is handled by `useEffect` with an empty dependency array `[]`. This will run only once, similar to `componentDidMount` in class components.

```js
import React, { useEffect } from 'react';

function MyComponent() {
  useEffect(() => {
    console.log("Component mounted!");

    // Cleanup function (equivalent to componentWillUnmount)
    return () => {
      console.log("Component unmounted!");
    };
  }, []); // Empty array means it runs only once when the component mounts

  return <div>My Component</div>;
}
```

#### **2. Updating**

If you want an effect to run when certain props or state change, you can specify them as dependencies inside the dependency array. This is similar to `componentDidUpdate` in class components.

```js
import React, { useState, useEffect } from 'react';

function MyComponent() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log("Component updated: ", count);

    // Cleanup function if needed (runs before the next effect or unmount)
    return () => {
      console.log("Cleaning up before update...");
    };
  }, [count]); // Runs whenever 'count' changes

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

In the example above, `useEffect` runs every time the `count` state changes, similar to `componentDidUpdate`.

#### **3. Unmounting**

You can use the cleanup function in `useEffect` to perform operations when the component unmounts, similar to `componentWillUnmount` in class components.

```js
useEffect(() => {
  console.log("Component mounted!");

  // Cleanup when the component unmounts
  return () => {
    console.log("Component unmounted!");
  };
}, []); // Empty array ensures this effect runs only once, at mount and unmount
```

The `return` function inside `useEffect` acts as the cleanup function and will be called when the component is removed from the DOM (or screen in React Native).

---

### **Common Patterns in Functional Components**

#### **ComponentDidMount (Mounting Phase)**

In class components, `componentDidMount` runs once after the component is mounted. In functional components, this can be replicated using `useEffect` with an empty dependency array `[]`:

```js
useEffect(() => {
  // Code to run once after the component mounts
  console.log("Component mounted!");
}, []);
```

#### **ComponentDidUpdate (Updating Phase)**

In class components, `componentDidUpdate` is called after every update. In functional components, you can specify the state or props that you want to monitor by adding them to the dependency array in `useEffect`:

```js
useEffect(() => {
  console.log("Component updated!");
}, [someState, someProp]);
```

#### **ComponentWillUnmount (Unmounting Phase)**

In class components, `componentWillUnmount` is called just before a component is removed. In functional components, you can use the cleanup function inside `useEffect`:

```js
useEffect(() => {
  // Code to run when the component is mounted

  return () => {
    // Cleanup code, run when the component is unmounted
    console.log("Component unmounted!");
  };
}, []);
```

---

### **Summary of Lifecycle Methods in Class Components and Functional Components**

| **Phase**       | **Class Component Method**               | **Functional Component Hook (useEffect)**             |
|-----------------|------------------------------------------|--------------------------------------------------------|
| **Mounting**    | `constructor`, `componentDidMount`       | `useEffect(() => {...}, [])` (empty dependency array)   |
| **Updating**    | `getDerivedStateFromProps`, `shouldComponentUpdate`, `componentDidUpdate` | `useEffect(() => {...}, [dependencies])`               |
| **Unmounting**  | `componentWillUnmount`                   | `useEffect(() => {...}, []).cleanup()` or return cleanup function |

Understanding the lifecycle methods and hooks helps you manage side effects, optimize performance, and ensure that resources are cleaned up properly in React Native applications.
