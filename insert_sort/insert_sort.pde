ArrayList<Rect> list;

int max; //Grenzwert für die Erzeugung der zufälligen Zahlen
int len; // Anzahl der Elemente
int end;
int idx;

color orange;
color blue;

float rate_x;

Rect rect;

void setup (){
  size (800, 600);
  frameRate (5); //Geschwindigkeit der Animation
  orange = color (255, 140, 0);
  blue   = color (30, 144, 255);
  len    = 40; 
  max    = 20;
  end    = 1;
  idx    = end - 1;
  list   = new ArrayList<Rect>();
  rate_x = width / len;
  
  fill_list();
  println("Feld vor der Sortierung: ");
  print_list();
  
  rect = list.get(end);
}

void draw (){
  background (blue);
  draw_list();
  if (end == list.size())
    {println("Feld nach der Sortierung: "); print_list(); noLoop();}
  else
    _sort();
}

void draw_list (){
    for (int i = 0; i < len; i++)
    {
      Rect temp = list.get (i);
      temp.set(i * rate_x, temp.y, temp._width, temp._height);
      temp._draw();
    }
}

void fill_list (){
    float rate_y = 0.0;
    int val      = 0;
    for (int i = 0; i < len; i++){
      Rect temp    = new Rect ();
      val          = int (random (1, max + 1));
      temp.value   = val;
      rate_y       = abs (height - ((height / max) * val));
      
      temp.set(i * rate_x, rate_y, rate_x, height - rate_y);
      list.add(temp);
    }
}



void print_list (){
    for (Rect temp : list)
      print (temp.value + " ");
    println();
}

void _sort (){
    if (idx == -1)
      idx = end - 1;
    
    boolean condition = rect.value < list.get(idx).value;
    
    if (condition)
    {
      list.set(idx + 1, list.get(idx));
      if (idx == 0)
        {list.set(0, rect); end++; rect = list.get(end);}
    }
    else if (!condition)
    {
    list.set(idx + 1, rect); 
    if (end == len - 1)
      {end++; return;}
    end++;
    idx  = end; 
    rect = list.get(end);
    }
    
    idx--;
}

class Rect {
  int value;
  
  float _width;
  float _height;
  float x;
  float y;
  
  
  Rect (){
    value   = 0;
    x       = 0.0;
    y       = 0.0;
    _width  = 0.0;
    _height = 0.0;
  }
  
  
  void _draw (){
      fill (orange);
      rect (x, y, _width, _height);
  }
  
  void set (float x, float y, float _width, float _height){
      this.x = x;
      this.y = y;
      
      this._width  = _width;
      this._height = _height;  
  }
  
}
