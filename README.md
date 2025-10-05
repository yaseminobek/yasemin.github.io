# yasemin.github.io
<details>
<summary>-About Me</summary>
Hi, I'm Yasemin Derin and I'm a 10th grader in Hisar Schools. I will upload my projects, codes, documentations and ideas here this year. 

  * I am taking AP Computer Science Principles

* I like reading and math

* Gmail: yasemin.obek@hisarschool.k12.tr 
</details>

<details>
<summary>-My Projects</summary>

  *[You can see my video from here](https://drive.google.com/file/d/1CfISpXEdErXukGdaux8WMcPuQCSN4EzL/view?usp=sharing]

*https://scratch.mit.edu/projects/1213290539/editor

https://www.figma.com/board/yGRg5OnMyrHJ7PAcD2pFjA/Analog-clock?node-id=0-1&t=hJreJNwbth6Pv1fB-1
<img width="784" height="447" alt="Screenshot 2025-09-21 at 23 51 10" src="https://github.com/user-attachments/assets/840f8d1a-869b-42d6-9114-f29633ea088c" />

https://drive.google.com/file/d/1BeLdLmb7uti2GuvbFwYbLnxzKCvLga6Q/view?usp=sharing

https://drive.google.com/file/d/1Bp52wNUulnQTn6LugeuEVZ6VQda_L_Tw/view?usp=sharing

https://drive.google.com/file/d/1U32qRvb4XcKD1ZyJpbF06eDG1SkGUiYo/view?usp=sharing

https://drive.google.com/file/d/1T-KeqEfNtT7xn75HJuDDtU1EPKxQkSdV/view?usp=sha<img width="579" height="360" alt="Screenshot 2025-10-06 at 00 02 30" src="https://github.com/user-attachments/assets/58cf16b9-c4a6-4d3e-bc46-79f189422004" />


<img width="927" height="590" alt="Screenshot 2025-10-06 at 00 01 53" src="https://github.com/user-attachments/assets/d950ef3d-6d69-4822-b998-0fa4a4fd3281" />

</details>

<details>
<summary>-Documentation</summary>

  This is a documentation of problems I have faced and how I overcame them
## Problems I faced:
Github: I faced problems such as my github site not opening and not being able to upload videos.

Scratch: I faced problems with making the squares show all at the same time. 

Clock: I forgot to put @State in front of minuteSeg, so the hand didn’t update.
       The hour kept going past 24.

Tic Tac Toe: After a player won, the app still let us tap more squares and the label sometimes changed to the next player’s turn.

Face: I first set the hair color on the wrong shape and colored the face instead of the hair.
## How I fixed them:
Github: First, I analyzed what the problem was.
        Then, I tried to think of ways I can fix them and asked for help from my teacher and friend. 
        After that, I applied the solution such as trying to upload my video from google drive instead of saved folders.

Scartch: I fixed this problem by adding directions to every square that shpuld have been on the screen and placed them accordingly. 

Clock:I fixed it by adding @State.
      I fixed it by using (hour + 1) % 24 to wrap back to 0.

Tic Tac Toe: I set gameOver = true in checkWinner() and only allow taps with if !gameOver && text.wrappedValue.isEmpty { ... }; call checkWinner() before switching turns.

Face: I fixed it by keeping the Capsule as (skin) and putting (hair) ont the RoundedRectangle that makes the hairs silhouette, then I defined let hair = Color(...) so that the same colors applied every part of it. 

</details>

<details>
 <summary>-Big Idea 1</summary>
 Big Idea 1: Creative Development is about how computer programs are built and improved through collaboration, design, testing, and error correction.
1.1 Collaboration
 Teamwork and problem-solving are essential in programming. Developers often collaborate with users and other programmers through methods like pair programming, project management tools, or platforms like GitHub. This ensures diverse perspectives and helps avoid bias.
1.2 Program Function and Purpose
 Every program has a function: it takes inputs (like text, images, or sounds), processes them, and produces outputs (like results, visuals, or feedback). The purpose is to solve real-world problems, whether through apps, devices, or systems.
1.3 Program Design and Development
 Designing programs involves planning with algorithms and pseudocode, then turning those into working code. Programmers test, gather data, and refine their solutions. Documentation and comments are also important to explain how and why the program works, making it easier for others to understand and improve.
1.4 Identifying and Correcting Errors
 Errors happen in coding—syntax errors, logic errors, or run-time errors. Debugging involves testing, error handling, and using tools like debuggers or extra print statements. This process helps ensure programs run correctly and efficiently.

 So to summarise, Creative Development is about working together, designing with purpose, coding carefully, and fixing mistakes to create programs that solve problems effectively.


</details>

<details>
<summary>-Reflection questions</summary>
1.Our target audience is teenagers who prefer simple and plain clocks.

2.Our design choices support this audiencer because it consists of neutral colors such as green, white and black. And it doesn't have any design on it, making it simple and plain.

3.While collecting examples in FigJam we saw several minimal analog clocks. These inspired us to keep the face uncluttered, use strong contrast for readability, and place the numbers with simple offsets instead of fancy graphics.

4.The hardest part was making the clock hands pivot correctly. I had to offset each Capsule so its base stayed at the center before applying the rotation angle, otherwise the hands spun around the wrong point.

5.I would add a simple color chooser so users can pick their own style palette.

1.A Button is a control that gives tap feedback, .onTapGesture just watches for a tap on any view.

2.Different people like or need different ways to change the clock, so it’s easier for everyone.

3.The slider because it’s quick to set the hour.

4.The clock updates only when you tap or slide, so it runs when events happen.

1.I learned that ForEach can put the 12 items (numbers, dots, or sport emojis) around the circle without writing each one by hand.



2.I learned that random can pick a random hour and 15-minute segment. In the color-dots mode, the dot colors also change randomly each time you interact with the clock.


3.I learned how to make the clock react: one tap adds 15 minutes, a double tap resets it, the buttons change the hour up or down, and the slider lets me choose an hour.


4.I learned how to add three different views and switch between them with top buttons: Numbers, Dots, and Sports.

1.I learned that computers use bits (0 and 1) and that binary uses the 8-4-2-1 place values.
2.I practiced converting numbers, like 0110₂ = 6 and 12₁₀ = 1100₂.
3.In Swift, I built a small 4-bit counter that shows decimal and binary and wraps to 0 after 15 (overflow) using (id + 1) % 16.




</details>



