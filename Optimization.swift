//
//  Optimization.swift
//  
//
//  Created by Apple on 07/04/25.
//


### **1. How can you optimize the performance of images?**
- **Resize Images**: Use appropriately sized images to reduce memory usage. Avoid loading large images when smaller resolutions are sufficient.
- **Use `Image.resizeMode`**: Options like `cover`, `contain`, or `stretch` can help in fitting images efficiently.
- **Lazy Loading**: Load images only when they are in view using libraries like `react-native-fast-image` or `react-native-image-lazy-load`.
- **Image Formats**: Prefer optimized formats like WebP, which offers smaller sizes without compromising quality.
- **Caching**: Use libraries like `react-native-fast-image` for image caching, ensuring frequently used images are not downloaded multiple times.
- **Optimize Animations**: Avoid high-resolution images for animations and use `ImageBackground` only when necessary.


### **2. How to optimize a large list in FlatList?**
- **Use `keyExtractor`**: Ensure each item has a unique key for rendering efficiency.
- **Virtualization**: FlatList is optimized for virtualization. It renders only what’s visible on the screen and recycles views.
- **Use `getItemLayout`**: If all rows have fixed height, specify `getItemLayout` to speed up rendering:
  ```javascript
  getItemLayout={(data, index) => ({ length: ITEM_HEIGHT, offset: ITEM_HEIGHT * index, index })}
  ```
- **Paging and Lazy Loading**: Implement pagination or infinite scrolling to load data incrementally.
- **Avoid Re-rendering**: Use `React.memo` for list items or a `PureComponent` to prevent unnecessary re-renders.
- **Reduce Overhead**: Use `initialNumToRender` and `maxToRenderPerBatch` to control batch rendering.


### **3. How can you avoid React Native multi-threading issues?**
- **Thread Isolation**: React Native separates the JavaScript thread, UI thread, and native threads to prevent conflicts. Avoid directly manipulating UI on non-UI threads.
- **Debounce and Throttle**: Use debounce or throttle for intensive operations to avoid blocking the JavaScript thread.
- **Long-Running Tasks**: Offload long-running tasks to background threads using libraries like `react-native-background-fetch` or `react-native-worker-thread`.
- **Optimize JSON Parsing**: Use tools like `jsonparse` to avoid blocking the JS thread with heavy parsing tasks.


### **4. Discuss ways to reduce memory leaks in apps**
- **Clean-Up Listeners and Subscriptions**: Remove event listeners, subscriptions, or timers in the `useEffect` cleanup or `componentWillUnmount`.
- **Avoid Unnecessary State Updates**: Prevent setting state on unmounted components with tools like `isMounted` flags or using libraries like `useRef`.
- **Optimize Component Usage**: Use `FlatList` instead of `ScrollView` for long lists to avoid holding large views in memory.
- **Avoid Circular References**: Ensure closures don’t unintentionally reference unnecessary variables.
- **Profiling**: Use tools like Xcode Instruments or Android Profiler to monitor memory usage and identify leaks.


### **5. How can you cache React Native images?**
- **Use Libraries**: Libraries like `react-native-fast-image` provide built-in caching mechanisms and improved performance.
- **File System Caching**: Cache images locally using libraries like `react-native-fs` to avoid repeated network calls.
- **Network Headers**: Utilize HTTP cache control headers to allow browser or app-level caching.
- **Service Workers**: For web-like environments, service workers can enable image caching.
- **Preload Images**: Preload frequently used images into cache using `Image.prefetch()` or `FastImage.preload()`.
