//
//  Innterview.swift
//  
//
//  Created by Apple on 06/04/25.
//

Here’s a breakdown of your questions:

1. **What are states?**
   - **State** is a React component's internal data that determines how it behaves and renders.
   - It is mutable and managed within the component using hooks like `useState` or in class components using `this.setState`.

2. **What are props?**
   - **Props** (short for properties) are data passed from a parent component to a child component.
   - They are **read-only** and cannot be modified by the receiving component.

3. **Differences between state and props**:
   | **Aspect**        | **State**                           | **Props**                      |
   |--------------------|--------------------------------------|---------------------------------|
   | **Mutability**    | Mutable (can change)                | Immutable (cannot change)      |
   | **Scope**         | Local to the component              | Passed from parent components  |
   | **Usage**         | For dynamic, internal component data| For passing data between components |
   | **Lifecycle**     | Managed within the component         | Defined by the parent component|

4. **What are default props in React Native and why are they necessary?**
   - **Default props** provide a fallback value for props when they aren’t explicitly passed by the parent.
   - They ensure components function correctly even if some props are missing.
   Example:
     ```javascript
     MyComponent.defaultProps = {
         title: "Default Title",
     };
     ```

5. **What is props drilling?**
   - **Props drilling** occurs when props are passed through multiple intermediate components just to reach a deeply nested child component.
   - This can make the code harder to read and maintain.

6. **How can we avoid props drilling in React Native?**
   - Use **Context API** to share data between components without passing props explicitly.
   Example:
     ```javascript
     const MyContext = React.createContext();
     ```

7. **How do you update the state of a component (class and functional)?**
   - **Class Components**: Use `this.setState()`:
     ```javascript
     this.setState({ count: this.state.count + 1 });
     ```
   - **Functional Components**: Use `useState` hook:
     ```javascript
     const [count, setCount] = useState(0);
     setCount(count + 1);
     ```

8. **How do you pass props between components?**
   - Pass props from a parent to a child:
     ```javascript
     <ChildComponent propName="value" />
     ```
   - Access them in the child:
     ```javascript
     function ChildComponent({ propName }) {
         return <Text>{propName}</Text>;
     }
     ```

9. **What is setNativeProps?**
   - `setNativeProps` allows you to directly modify the properties of a native view in React Native without re-rendering the component.
   - Use it cautiously, as it bypasses React's state management.
   Example:
     ```javascript
     this.ref.setNativeProps({ style: { backgroundColor: 'blue' } });
     ```

If you'd like me to elaborate on any of these points or examples, feel free to ask!

1. **What are touchable components in React Native?**
   Touchable components in React Native respond to user interactions like taps or presses. Common touchable components include:
   - `TouchableOpacity`: Reduces opacity on press.
   - `TouchableHighlight`: Highlights the wrapped view on press.
   - `TouchableWithoutFeedback`: Detects touches without visual feedback.
   - `Pressable`: A flexible and modern alternative for touch handling.

2. **What is Flexbox in React Native?**
   Flexbox is a layout system used in React Native to design interfaces. It organizes elements along a row or column, providing efficient and responsive layouts.

3. **What are the properties of Flexbox in React Native?**
   Key properties include:
   - `flexDirection`: Defines layout direction (`row` or `column`).
   - `justifyContent`: Aligns children along the main axis.
   - `alignItems`: Aligns children along the cross axis.
   - `flexWrap`: Defines whether children should wrap onto multiple lines.

4. **How does alignItems and justifyContent work when flexDirection is row?**
   When `flexDirection` is `row`:
   - `justifyContent`: Aligns children horizontally (e.g., start, center, space-between).
   - `alignItems`: Aligns children vertically (e.g., flex-start, center).

5. **What is the difference between alignItems and alignContent?**
   - `alignItems`: Aligns individual items along the cross axis.
   - `alignContent`: Aligns a group of lines if `flexWrap` is enabled. It doesn't affect single-line layouts.

6. **What does flexWrap mean?**
   `flexWrap` allows child components to wrap onto multiple lines instead of overflowing the parent container.

7. **What are pure components in React Native?**
   Pure components are React components that optimize rendering by implementing `shouldComponentUpdate()` to prevent unnecessary updates. They compare props and state shallowly.

8. **What is meant by display flex?**
   `display: flex` activates the Flexbox layout system for arranging components.

9. **What is KeyboardAvoidingView?**
   `KeyboardAvoidingView` is a wrapper component that adjusts its layout to prevent the keyboard from overlapping interactive components.

10. **What is VirtualizedList?**
    `VirtualizedList` is a performant component for rendering large lists by recycling views that are off-screen, reducing memory usage.

11. **Listview in React Native**:
    React Native has deprecated `ListView`. Modern alternatives include `FlatList` and `SectionList`, which are optimized for scrolling and performance.

12. **What is the difference between an element and a component?**
    - **Element**: A single instance of a component (e.g., JSX syntax).
    - **Component**: A reusable UI structure, defined as a function or class.

13. **Are all components used in React used in React Native as well?**
    No, React Native provides additional components optimized for mobile apps, like `FlatList`, `ScrollView`, and `Text`, while React includes web-specific components like `div`, `span`, etc.

Would you like to dive deeper into any of these topics? There's always more to explore!


StyleSheet.create() is used to define styles for components. It helps:
Validation: Ensures the styles are valid and improves debugging.
Performance: Optimizes rendering by freezing the styles, which prevents unnecessary recalculations.

                                                    
                                                    
Flexbox in Browser vs Flexbox in React Native: While Flexbox's core principles are consistent in both, there are some differences:
Direction: In React Native, the default flexDirection is column (vertical), whereas in the browser it's row (horizontal).
Units: React Native uses unitless values for dimensions (e.g., flex, padding) instead of px, %, or em used in the browser.
CSS Properties: Some Flexbox properties (e.g., alignContent) are either not applicable or behave differently in React Native.
Cross-platform: React Native implements Flexbox as a layout system for mobile apps, optimizing for both iOS and Android, while browsers use it primarily for web layouts.
                                                    

                                                    
1. How does React Native run in the background?
   React Native uses **Headless JS** to run tasks in the background. This allows JavaScript code to execute even when the app is not in the foreground. Tasks like syncing data, handling push notifications, or playing music can be performed using this feature. Headless JS is primarily available for Android.

2. **What is Virtual DOM and how does it work in the background?**
   The Virtual DOM is a lightweight, in-memory representation of the real DOM. React uses it to efficiently update the UI. When the app state or props change, React creates a new Virtual DOM and compares it with the previous one using a **diffing algorithm**. Only the differences are applied to the real DOM, minimizing unnecessary updates and improving performance.

3. **What is the process of reconciliation in React Native?**
   Reconciliation is the algorithm React uses to update the UI efficiently. It involves creating a virtual representation of the UI, comparing the new version with the previous one, and applying only the necessary changes to the real DOM or native views. React Native uses a **Virtual Tree** for this process, which is optimized for native views.

4. **How is Virtual DOM better compared to Real DOM and Shadow DOM?**
   - **Virtual DOM**: Efficiently updates only the changed parts of the real DOM, reducing performance overhead.
   - **Real DOM**: Updates the entire DOM, which is slower and less efficient.
   - **Shadow DOM**: Provides encapsulation for styles and DOM elements, mainly used in web components, but doesn't focus on performance optimization like the Virtual DOM.

5. **What are the threads in React Native?**
   React Native operates with two main threads:
   - **UI Thread (Main Thread)**: Handles rendering and user interactions.
   - **JavaScript Thread**: Executes React's render phase and layout calculations.
   The threading model ensures thread safety by using immutable data structures.

