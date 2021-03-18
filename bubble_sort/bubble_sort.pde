Rect[] arr;
float rate_y;
float rate_x;
float max = 20; //Grenzwert für die Erzeugung der zufälligen Zahlen
int   len = 40; // Anzahl der Elemente
color white;
color red;
int k;


void setup (){
  size (800, 600);
  frameRate (10); // Geschwindigkeit der Animation
  arr = new Rect[len];
  _fill();
  rate_x = width / arr.length;
  white = color (255);
  red   = color (255, 0, 0);
  k     = 0;
  
  println("Feld vor der Sortierung");
  display();
}

void draw (){
  background (0);
  draw_arr();
  
  if (len == -1)
    {println("Feld nach der Sortierung"); display(); noLoop();}
  else  
    _sort();
}

void _sort (){
  if(k < len - 1)
  {
    arr[k].change_color(red);
    if (arr[k].value > arr[k + 1].value)
    {
      swap (k , k + 1);
    }
    else
      arr[k].change_color(white);
    k++;
  }
  else
    {k = 0; len--;}  
}

void display (){
    for (Rect temp: arr)
      print (temp.value + " ");
      
    println();
}


void _fill (){
    for (int i = 0; i < arr.length; i++){
        arr[i]   = new Rect();
        int temp = int (random (1, max + 1));
        
        arr[i].value = temp;
    }
}

void draw_arr (){
  for (int i = 0; i < arr.length; i++){
      Rect temp = arr[i];
      
      setRate_y (temp.value);
     
      temp.set(i * rate_x, rate_y, rate_x, height - rate_y);
      temp._draw();
  }  
}


void setRate_y (int val){
  rate_y = abs (height - ((height / max) * val));
}

void swap (int i, int j){
    Rect temp = arr[i];
    arr[i]    = arr[j];
    arr[j]    = temp;
}


class Rect {
  int value;
  
  float _width;
  float _height;
  float x;
  float y;
  
  color def;
  
  Rect (){
    value   = 0;
    def     = white;
    x       = 0.0;
    y       = 0.0;
    _width  = 0.0;
    _height = 0.0;
  }
  
  
  void _draw (){
      fill (def);
      rect (x, y, _width, _height);
  }
  
  void set (float x, float y, float _width, float _height){
      this.x = x;
      this.y = y;
      
      this._width  = _width;
      this._height = _height;  
      
      def = white;
  }
  
  void change_color (color c){
      def = c;
      _draw();
  }

}
