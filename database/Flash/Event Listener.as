addEventListener(Event.ENTER_FRAME, onEnter);private function onEnter(e:Event):void{    hero.update();    ground.update();    //do other stuff    }//Normal Event Listeners/* figure 03 */public class EventDispatcher {  private var listeners:Object = {};  /**   * Registers the handler to be executed when an event of the supplied   * type occurs.   */  public function addEventListener(type:String, handler:Function):void {    listeners[type] ||= [];    listeners[type].push(handler);  }  /**   * Signals that an event of the supplied type has occurred. Calls   * all handlers, passing each one the event as an argument.   */  public function dispatchEvent(event:Event):void {    for each (var handler:Function in listeners[type]) {      // though we passed it around as a value, it's still      // a function... and we can call it as one with "()".      handler(event);    }  }}//State-based Event Listeners/* figure 04 */private function handleClick(event:MouseEvent):void {  switch (state) {    case INPUT:      // behavior of click event while in input state      break;    case LOADING:      // behavior of click event while in loading state      break;    case VIEW:      // behavior of click event while in view state      break;  }}private function handleClick(event:MouseEvent):void {  switch (state) {    case INPUT:      // behavior of move event while in input state      break;    case LOADING:      // behavior of move event while in loading state      break;    case VIEW:      // behavior of move event while in view state      break;  }}//or/* figure 05 */public class InputHandler {  /* state constants */  public static const INPUT:String = "input";  public static const LOADING:String = "loading";  public static const VIEW:String = "view";  /* stores current value of "this" */  private var self:InputHandler = this;  /* input handlers */  private var handlers:Object = {    input: {      click: function(event:MouseEvent):void {        // click handler for input state      },      move: function(event:MouseEvent):void {        // mouse move handler for input state      }    },    loading: {      click: function(event:MouseEvent):void {        // click handler for loading state      },      move: function(event:MouseEvent):void {        // mouse move handler for loading state      }    },    view: {      click: function(event:MouseEvent):void {        // click handler for view state      },      move: function(event:MouseEvent):void {        // mouse move handler for view state      }    }  };  private var _state:String = "input";  public function get state():String {return _state;}  public function set state(value:String):void {    if (_state != value) {      // replace click handler      removeEventListener(MouseEvent.CLICK, handlers[state].click);      addEventListener(MouseEvent.CLICK, handlers[value].click);      _state = value;    }  }}