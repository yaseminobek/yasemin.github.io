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
https://scratch.mit.edu/projects/1232391798/

https://www.figma.com/board/yGRg5OnMyrHJ7PAcD2pFjA/Analog-clock?node-id=0-1&t=hJreJNwbth6Pv1fB-1
<img width="784" height="447" alt="Screenshot 2025-09-21 at 23 51 10" src="https://github.com/user-attachments/assets/840f8d1a-869b-42d6-9114-f29633ea088c" />

https://drive.google.com/file/d/1BeLdLmb7uti2GuvbFwYbLnxzKCvLga6Q/view?usp=sharing

https://drive.google.com/file/d/1Bp52wNUulnQTn6LugeuEVZ6VQda_L_Tw/view?usp=sharing

https://drive.google.com/file/d/1U32qRvb4XcKD1ZyJpbF06eDG1SkGUiYo/view?usp=sharing

https://drive.google.com/file/d/1T-KeqEfNtT7xn75HJuDDtU1EPKxQkSdV/view?usp=sha<img width="579" height="360" alt="Screenshot 2025-10-06 at 00 02 30" src="https://github.com/user-attachments/assets/58cf16b9-c4a6-4d3e-bc46-79f189422004" />

Data Compression: https://docs.google.com/document/d/1QLFtNUki7_yCDZQ8Zv-EKBLR279OlJ4YPLcjmfwzvLo/edit?usp=sharing
https://drive.google.com/drive/folders/1mOU1mwLQAHplIshOi4BHngeB8AsP0QiA?usp=sharing

<img width="927" height="590" alt="Screenshot 2025-10-06 at 00 01 53" src="https://github.com/user-attachments/assets/d950ef3d-6d69-4822-b998-0fa4a4fd3281" />

My frog escape challenge video: https://drive.google.com/file/d/1lDGcnsO5-YwSSu06hlzXrt4zp5sgDN44/view?usp=sharing

apcsp-part1-data-practice
“This exercise is inspired by the AP CSP learning objectives (Big Idea 2), but all data and examples are original classroom material created for practice purposes.”:
https://docs.google.com/document/d/1SYXB7NRoQkhnSHEKCEKei7ybchmrwjH-jWkH5Q1WSpk/edit?usp=sharing

Candy Shop Simulation Video:
https://drive.google.com/file/d/1BwNzb7UE3lmqCs6l1X6cZfuzSefMc3s1/view?usp=sharing
Candy Shop Simulation Screenshot:

<img width="960" height="716" alt="Screenshot 2025-10-22 at 21 29 53" src="https://github.com/user-attachments/assets/206aadfb-f61d-4448-941d-7cabf923c456" />

Bit Binary Counter Console:
<img width="794" height="556" alt="Screenshot 2025-10-22 at 21 47 53" src="https://github.com/user-attachments/assets/673024f9-a148-4431-b6f4-079e5e65283b" />
Extracting information from data: https://docs.google.com/document/d/1fcESJzATuzQaV0ncaudRc0FqWIG0rbNHiQt28-d-3Fs/edit?tab=t.0#heading=h.7jrsmptdjn6i
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
<summary>-Reflection questions</summary>
Clock 3:
 1.Our target audience is teenagers who prefer simple and plain clocks.

2.Our design choices support this audiencer because it consists of neutral colors such as green, white and black. And it doesn't have any design on it, making it simple and plain.

3.While collecting examples in FigJam we saw several minimal analog clocks. These inspired us to keep the face uncluttered, use strong contrast for readability, and place the numbers with simple offsets instead of fancy graphics.

4.The hardest part was making the clock hands pivot correctly. I had to offset each Capsule so its base stayed at the center before applying the rotation angle, otherwise the hands spun around the wrong point.

5.I would add a simple color chooser so users can pick their own style palette.

Clock 2:
1.A Button is a control that gives tap feedback, .onTapGesture just watches for a tap on any view.

2.Different people like or need different ways to change the clock, so it’s easier for everyone.

3.The slider because it’s quick to set the hour.

4.The clock updates only when you tap or slide, so it runs when events happen.

Clock 5:
1.I learned that ForEach can put the 12 items (numbers, dots, or sport emojis) around the circle without writing each one by hand.



2.I learned that random can pick a random hour and 15-minute segment. In the color-dots mode, the dot colors also change randomly each time you interact with the clock.


3.I learned how to make the clock react: one tap adds 15 minutes, a double tap resets it, the buttons change the hour up or down, and the slider lets me choose an hour.


4.I learned how to add three different views and switch between them with top buttons: Numbers, Dots, and Sports.

Binary:
1.I learned that computers use bits (0 and 1) and that binary uses the 8-4-2-1 place values.
2.I practiced converting numbers, like 0110₂ = 6 and 12₁₀ = 1100₂.
3.In Swift, I built a small 4-bit counter that shows decimal and binary and wraps to 0 after 15 (overflow) using (id + 1) % 16.

Ice Cream:
1.Overflow:
In my app, overflow happens when I add more than five scoops. The cone resets to empty when this happens. 

2.Abstraction:
The cone shows memory, and each scoop is like stored data. It’s a simple way to see how computers hold and lose information.

3.Binary & Compression:
I learned that binary numbers have limits. When we pass the limit, data resets or gets lost—like when the cone overflows.

Frog Escape Challenge:
In my Clock Game, I learned how to use @State, timers, and simple logic to make a game that resets when time runs out. It helped me understand overflow and practice if and else.



</details>
<details>
<summary>-Big Idea 1</summary>
Big Idea 1: Creative Development is about how computer programs are built and improved through collaboration, design, testing, and error correction. 1.1 Collaboration Teamwork and problem-solving are essential in programming. Developers often collaborate with users and other programmers through methods like pair programming, project management tools, or platforms like GitHub. This ensures diverse perspectives and helps avoid bias. 1.2 Program Function and Purpose Every program has a function: it takes inputs (like text, images, or sounds), processes them, and produces outputs (like results, visuals, or feedback). The purpose is to solve real-world problems, whether through apps, devices, or systems. 1.3 Program Design and Development Designing programs involves planning with algorithms and pseudocode, then turning those into working code. Programmers test, gather data, and refine their solutions. Documentation and comments are also important to explain how and why the program works, making it easier for others to understand and improve. 1.4 Identifying and Correcting Errors Errors happen in coding—syntax errors, logic errors, or run-time errors. Debugging involves testing, error handling, and using tools like debuggers or extra print statements. This process helps ensure programs run correctly and efficiently.
So to summarise, Creative Development is about working together, designing with purpose, coding carefully, and fixing mistakes to create programs that solve problems effectively.

https://drive.google.com/file/d/1CfISpXEdErXukGdaux8WMcPuQCSN4EzL/view?usp=sharing
</details>

<details>
<summary>-Big Idea 2</summary>
2.1 Binary Numbers:
Main idea: Computers represent all data using the binary system, which only uses 0s and 1s. Each digit’s position represents a power of 2.
Example or concept learned: For instance, the binary number 0101 equals 5 in decimal because it represents 08 + 14 + 02 + 11 = 5.

Reflection: I learned that computers can only process data in binary, which means everything from images to songs is stored using combinations of 0s and 1s. This matters because it shows how all digital information is simplified into a universal language.This is fascinating because it shows how complex systems are built on a very simple foundation.

Question: How do computers convert complex information like colors and sounds into binary so quickly and accurately?

2.2 Data Compression:
Main idea: Data compression reduces the size of digital files by removing repetition or unnecessary information so they use less storage and transmit faster.
Example or concept learned: I learned about Run-Length Encoding (RLE), which shortens repeated bits like 11110000 : (4,1)(4,0). Lossy compression (like JPEG or MP3) removes details humans don’t notice, while lossless compression keeps every bit of original data.

Reflection: I found it interesting that compression allows faster file sharing but sometimes sacrifices quality. It made me realize how important compression is for things like streaming and texting. I was surprised that lossy compression permanently deletes data, which shows the trade-off between saving space and keeping perfect quality.

Question: Is there a way to design a compression method that keeps all the data (like lossless) but is as efficient as lossy compression?

2.3 Extracting Information From Data:
Main idea: Before data can be used, computers must clean, organize, and validate it to remove errors and inconsistencies. This process is called data cleaning and helps ensure accuracy in analysis.
Example or concept learned: For example, survey results like “AP CSP,” “ap csp,” and “AP Computer Science Principles” must be cleaned to be treated as the same response.

Reflection: I realized that data cleaning is one of the most important steps in data science because raw data is often messy or biased. This matters in real life when analyzing surveys, polls, or research results. Without cleaning, we could draw wrong conclusions or make poor decisions based on faulty information.

Question: Can machine learning algorithms fully clean and organize data automatically, or will humans always be needed for context and judgment?

2.4 Transforming Data
Main idea: Transforming data means modifying, combining, or visualizing data to make it more useful and understandable. This often involves programs like Google Sheets or Excel, or even programming tools that help analyze trends.
Example or concept learned: For instance, spreadsheet functions can calculate averages, and graphs or charts can visualize trends in large datasets for better decision making.

Reflection: I learned that transforming and visualizing data helps people quickly identify patterns and make data-driven decisions. This is how companies, scientists, and governments use data in the real world. It’s interesting that behind every simple graph or chart, there’s a huge process of organizing and transforming information.

Question: How do big tech companies handle transforming massive data sets, like millions of users’ search histories, in real time?

My Video:
https://drive.google.com/file/d/11Jcfd-ekgKxisfiRhTucz6YQ5uREFhAj/view?usp=sharing




