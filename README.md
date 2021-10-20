# cycle-factors
cycle-factors visualizes the factor tree of numbers, always started from the smallest factor. For example, consider the number 7203 (visualized in cycle-factors) below:
1. The smallest factor of 7203 is three (3*2401=7203) so three 2401-circles orbit the central circle (the 7203-circle). 
2. The smallest factor of 2401 is seven (7*343=2401) so seven 343-circles orbit each of the three 2401-circles.
3. The smallest factor of 343 is seven (7*49=2401) so seven 49-circles orbit each of the seven 343-circles.
4. The smallest factor of 49 is seven (7*7=49) so seven 7-circles orbit each of the seven 49-circles.
5. The smallest factor of 7 is one (1*7=7) so seven 1-circles orbit each of the seven 7-circles... and the process stops at one.

<p align="center">
<img src="https://github.com/russchertow/cycle-factors/blob/main/example_pic.PNG" height=50% width=50%>
</p>

Define the number in the top-left corner by typing it (using numeric keys and <code>backspace</code> for deletion). Use <code>↑</code> to zoom in and <code>↓</code> to zoom out.
