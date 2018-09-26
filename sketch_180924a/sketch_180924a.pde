

Grid arena = new Grid(4);
boolean[][] nodesVisited = new boolean[arena.getSize()][arena.getSize()];
Coordinates coordinates = new Coordinates(0,0);
Stack<Coordinates> stack = new Stack<Coordinates>();
Robot robot;

void setup() {
  size(500,500);
  rotate(radians(90));
  scale(1,-1);
  arena.markCrossing(new Coordinates(0,3),-1);
  arena.markCrossing(new Coordinates(1,1),-1);
  arena.markCrossing(new Coordinates(3,0),-1);
  arena.markCrossing(new Coordinates(3,2),-1);
  arena.drawGrid();
  robot = new Robot(arena);
  nodesVisited[0][0] = true;
  //robot.updateInMemoryGrid(new Coordinates(0,0),0);
  stack.push(coordinates);
}

void draw() {
  if(stack.empty()) {break;}
  
            coordinates = stack.pop();
            nodesVisited[coordinates.x][coordinates.y] = true;
            robot.updateInMemoryGrid(coordinates,arena.whatState(coordinates));
            //inMemoryGrid.showGrid();

            robot.visitToNode(coordinates);  // Robot moves here
            
            
            robot.addToVisitHistory(coordinates);

            if(arena.whatState(coordinates)==0) {
                List<Coordinates> neigh = arena.neighbourNode(coordinates);
                for (Coordinates c : neigh) {
                    if(!nodesVisited[c.x][c.y]) {
                        stack.add(c);
                    }
                }
            }
}
