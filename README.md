# Project 4 - *Trivia Quiz*

Submitted by: **Fariha Kha**

**Trivia Quiz** is an app that allows users to test their knowledge by answering trivia questions fetched from the Open Trivia Database API. Users can play through a set of questions, see their score at the end, and restart the game with new questions.

Time spent: **3** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] User can view and answer at least 5 trivia questions.
- [x] App retrieves question data from the Open Trivia Database API.
- [x] Fetch a different set of questions if the user indicates they would like to reset the game.
- [x] Users can see score after submitting all questions.
- [x] True or False questions only have two options (handled by API response).

The following **optional** features are implemented:

- [ ] Allow the user to choose a specific category of questions.
- [ ] Provide the user feedback on whether each question was correct before navigating to the next.

The following **additional** features are implemented:

- [x] Properly handles HTML entities in question text (like &quot;)
- [x] Shuffles answer choices for each question
- [x] Clean UI with gradient background and rounded question container

## Video Walkthrough

[Guide](https://www.youtube.com/watch?v=GA92eKlYio4) on how to embed Loom videos on GitHub.

## Notes

Challenges encountered while building the app:

1. **HTML Entities**: The API returns questions with HTML entities (like &quot; for quotes) which needed to be decoded for proper display. Solved by creating an extension to decode HTML entities.

2. **Asynchronous Network Calls**: Had to ensure UI updates happened on the main thread after network requests completed. Used DispatchQueue.main.async for this.

3. **Answer Shuffling**: Needed to shuffle both correct and incorrect answers together while still being able to track the correct answer. Implemented by creating a new shuffled array while keeping track of the correct answer index.

4. **Error Handling**: Needed to handle cases where network requests fail or return invalid data. Currently shows no questions in this case, could be improved with error messages.

## License

    Copyright 2023 Your Name

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
