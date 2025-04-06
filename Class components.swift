//
//  Class components.swift
//  
//
//  Created by Apple on 06/04/25.
//

import Foundation

Here’s a comprehensive breakdown of your questions:

1. **What are class components in React Native?**
   Class components are one of the ways to define components in React and React Native. They are ES6 JavaScript classes that extend the `React.Component` base class. These components are stateful and come with built-in lifecycle methods.
   Example:
   ```javascript
   import React, { Component } from 'react';
   import { Text, View } from 'react-native';

   class MyComponent extends Component {
       render() {
           return (
               <View>
                   <Text>Hello from Class Component!</Text>
               </View>
           );
       }
   }

   export default MyComponent;
   ```

2. **Explain the lifecycle of a class component**:
   The lifecycle of a class component can be divided into three main phases:
   - **Mounting**: When the component is being created and added to the DOM.
     - Methods: `constructor()`, `componentWillMount()` (deprecated), `render()`, `componentDidMount()`.
   - **Updating**: When the component is re-rendered due to changes in props or state.
     - Methods: `shouldComponentUpdate()`, `render()`, `componentDidUpdate()`.
   - **Unmounting**: When the component is being removed from the DOM.
     - Method: `componentWillUnmount()`.

   Modern React has replaced many of these lifecycle methods with **hooks** in functional components.

3. **For what reason, the render() method is used inside a class component?**
   The `render()` method is a required method in class components. It defines what the UI of the component should look like. It must return JSX, which React Native renders into native views.

4. **When is the constructor method called inside the class component?**
   The `constructor()` method is called when the component is initialized (during the mounting phase). It’s used for:
   - Initializing state.
   - Binding event handlers to the class instance.
   - Calling `super(props)` to access the `props` from `React.Component`.

   Example:
   ```javascript
   constructor(props) {
       super(props);
       this.state = { count: 0 };
   }
   ```

5. **In which case would you prefer a class component over a functional component?**
   Class components might be preferred in scenarios where:
   - The project still uses an older version of React (before the introduction of hooks in React 16.8).
   - You need explicit lifecycle methods like `componentDidMount()` or `shouldComponentUpdate()`.
   However, functional components with hooks are now the standard because they’re simpler, more readable, and provide all the functionality class components do.

If you need more examples or further clarification, let me know—I’d be happy to elaborate!
