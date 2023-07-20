# Flutter Assessment - README

## Overview

[Provide a brief description of the project]

## Issues and Suggested Changes

Here are some identified issues with the code along with suggested changes to address them:

1. **Issue: Inefficient approach to storing the counts**

   **Suggested Change:** Instead of using a list to store the counts, use a `Map<int, int>` where the keys represent the index of the list item and the values represent the count.

2. **Issue: Incorrect usage of the `super` keyword in constructors**

   **Suggested Change:** Remove the `super.key` from the constructor parameters, as it is not needed.

3. **Issue: Missing key parameter in constructors**

   **Suggested Change:** Add a `Key? key` parameter to the constructors of `ListWidget` and `ListItemWidget` classes to handle widget rebuilding correctly.

4. **Issue: Using `late` for ScrollController without null check**

   **Suggested Change:** Initialize the `ScrollController` with a non-null value to avoid null checks.

5. **Issue: Incorrect placement of the `addListener` call**

   **Suggested Change:** Move the `_scrollController.addListener` call outside the build method to prevent multiple listener registrations on each build.

6. **Issue: Inefficient resetting of the first item's count on every scroll event**

   **Suggested Change:** Implement a more efficient way to reset the first item's count only when it reaches the top or bottom.

7. **Issue: Not using `const` for the Text widget in ListItemWidget**

   **Suggested Change:** Use `const Text` for the Text widget in `ListItemWidget` to optimize widget creation.

8. **Issue: Stateful widget for ListItemWidget when not needed**

   **Suggested Change:** Since the count is managed in the parent widget, use a `StatelessWidget` for `ListItemWidget`.

9. **Issue: No separation of concerns**

   **Suggested Change:** Consider separating the state management logic from the presentation logic by using a dedicated data model or provider.

## Getting Started

[Provide instructions on how to set up and run the project]

## License

[Specify the project's license information]
