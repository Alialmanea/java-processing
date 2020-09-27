
char[][] board = new char[3][3];
char[] player = {'X', 'O'};
float Xp,Yp;
float h;
float w;
char currnetplayer;
String winner;


void mousePressed(){
  int j = int(mouseX / w);
  int i = int(mouseY / h);
  
  if (board[i][j] == 0){
    if (currnetplayer == player[0]){
      board[i][j] = player[0];
      currnetplayer = player[1];
  }else if (currnetplayer == player[1]){
    board[i][j] = player[1];
    currnetplayer = player[0];
    }
  } 
}

boolean equals3(char a,char b,char c) {
  return a == b && b == c && a != 0;
}

String checkWinner() {
  String winner = null;

  // horizontal
  for (int i = 0; i < 3; i++) {
    if (equals3(board[i][0], board[i][1], board[i][2])) {
      winner = str(board[i][0]);
    }
  }

  // Vertical
  for (int i = 0; i < 3; i++) {
    if (equals3(board[0][i], board[1][i], board[2][i])) {
      winner = str(board[0][i]);
    }
  }

  // Diagonal
  if (equals3(board[0][0], board[1][1], board[2][2])) {
    winner = str(board[0][0]);
  }
  if (equals3(board[2][0], board[1][1], board[0][2])) {
    winner = str(board[2][0]);
  }

  int openSpots = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 0) {
        openSpots++;
      }
    }
  }

  if (winner == null && openSpots == 0) {
    return "tie";
  } else {
    return winner;
  }
}


void setup(){
  size(400, 400);
  h = height /3;
  w = width / 3;
  currnetplayer = player[int(random(0, 1))];
   
}


void draw(){
  background(255);
  strokeWeight(3);
  stroke(0);
  line(w, 0, w, height);
  line(w * 2, 0, w * 2, height);
  line(0, h, width, h);
  line(0, h * 2, width, h * 2);
  strokeWeight(4);
  for (int i = 0; i < board.length; i++){
    for (int j = 0; j < board[i].length; j++){
      float x = w * j + w / 2;
      float y = h * i + h / 2;
      char spot = board[i][j];
      textSize(32);
      if (spot == player[0]){
        float xr = w / 4;
        line(x - xr, y - xr, x + xr, y + xr);
        line(x + xr, y - xr, x - xr, y + xr);
      }else if (spot == player[1]){
        noFill();
        ellipse(x, y, w/2, w/2);
      }
    }
  }
  winner = checkWinner();
  if (winner != null){
     noLoop();
     clear();
     background(255);
     textSize(30);
     fill(0);
     text(winner+" is Winner", height/3, width/2);
  }
}
