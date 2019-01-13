// Game Class (with a "Custom Event")
package {
  // Imports the classes whose methods are used
  import flash.events.*;           // To be able to use /extend the EventDispatcher Class
  import flash.utils.*;            // Necessary for setTimeout

 // Create the Game class which extends the EventDispatcher
 public class Game extends EventDispatcher
 {
  // Define a constant that will represent the name of the new event
  // Its value gives the name of the event
  public static const GAME_OVER:String = 'gameOver';

  // Private property, used only in the class to store a counting
  private var sec:int = 0;

  // Constructor
  public function Game(end:int)
  {
    // Call the "count()" function with the property "sec" as argument
    count(this.sec);

    // The function "count()" inside the constructor
    function count(sec:int):void
    {
      // If the property 'sec' has the value of 3, calls the "endGame()" method
      if(this.sec==end) endGame();
      else
      {
        trace(sec);                  // Displays in Output the value of the 'sec' parameter
        this.sec = sec+1;            // Modify the value of the "sec" property
        // "this.sec" is the property, 'sec' is the function's parameter

        // Calls the function "count()" every second, with the property "sec" as argument
        setTimeout(count, 1000, this.sec);
      }
    }
  }

  // The private method, called when "sec" reaches the value of the "end" parameter
  // "end" is the constructor's parameter and must be passed when the instance of the classe is created
  private function endGame():void
  {
    // Trigger the event created and represented by this class
    dispatchEvent(new Event(Game.GAME_OVER));
  }
 }
}


// Create an instance of the Game class
var game:Game = new Game(3);

// Register an event listener to detect the Game.GAME_OVER event
game.addEventListener(Game.GAME_OVER, gameOverListener);

// You can also use the value of the GAME_OVER constant ('gameOver', gameOverListener)

// Function called when the event is triggered
function gameOverListener (evt:Event):void
{
  trace('The game is over!');
}