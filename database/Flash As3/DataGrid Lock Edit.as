col1 = new DataGridColumn("Model");    col1.headerText = "Model #";    c2.consumables_dg.addColumn(col1);    col1.width = 60;    col1.editable = false;    col1.sortable = false;    col1.cellRenderer = AlternatingRowColors_editNum_PurchasePrice;col1 = new DataGridColumn("PurchasePrice");    col1.headerText = "Purchase Price";    c2.consumables_dg.addColumn(col1);    col1.width = 60;    col1.editable = false;    col1.sortable = false;    col1.cellRenderer = AlternatingRowColors_editNum_PurchasePrice;package{    import flash.text.TextFormat;    import flash.text.TextFormatAlign;    import fl.controls.TextInput;    import flash.text.TextFieldType;    import flash.events.Event;    import fl.controls.listClasses.ListData;    import fl.controls.listClasses.ICellRenderer;public class AlternatingRowColors_editNum_PurchasePrice extends TextInput implements ICellRenderer{    protected var _data:Object;    protected var _listData:ListData;    protected var _selected:Boolean;    private var __enabled:Boolean = false;    public static var _stage;    public static var _alignment;    private var tf:TextFormat;    public function AlternatingRowColors_editNum_PurchasePrice()    {        tf = new TextFormat();        if(__enabled){                if(_alignment == 2){                    tf.align = TextFormatAlign.RIGHT;                }else if(_alignment == 1){                    tf.align = TextFormatAlign.CENTER;                }else{                    tf.align = TextFormatAlign.LEFT;                }            restrict = "0-9.";            addEventListener(Event.CHANGE, textChange);        }else{            //this.selectable = false; // did not work            //textField.selectable = false; // did not work            //textField.type = dynamic; // did not work            //textField.type = TextFieldType.DYNAMIC; // did not work            //this.mouseEnabled = false; // did not work            //this.tabEnabled = false; // did not work            //textField.mouseEnabled = false; // did not work            //textField.tabEnabled = false; // did not work            //selectable = false; // did not work            //this.selectable = false; // did not work            //_enabled = false; // did not work            //-----------------------------------------------------------            //   *** Corresponding Entry to enable was placed above ***            //-----------------------------------------------------------        }        super();    }    public function textChange(Event):void{        //trace(_data.Discount);        _data.PurchasePrice = text;    }    public function get data():Object    {        return _data;    }    public function set data(value:Object):void    {        _data = value;        text = value.PurchasePrice;        if(value.Model != "") __enabled = true;        if (value.id % 2 == 0) {            setStyle("upSkin", AlternateColor1 );        } else {            setStyle("upSkin", AlternateColor2 );        }    }    public function get listData():ListData    {        return _listData;    }    public function set listData(value:ListData):void    {        _listData = value;    }    public function get selected():Boolean    {        return _selected;    }    public function set selected(value:Boolean):void    {        _selected = value;    }    public function setMouseState(state:String):void    {    }    override protected function drawLayout():void    {        textField.setTextFormat(tf);        super.drawLayout();    }}}