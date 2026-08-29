#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <string>
#include <cmath>

using namespace std;

struct Cell {
    int r, c;
};

struct AStarNode {
    int r, c;
    int g, h, f;
    bool operator>(const AStarNode& other) const {
        return f > other.f;
    }
};

int dr[4] = {0, 0, -1, 1};
int dc[4] = {-1, 1, 0, 0};

int heuristic(int r1, int c1, int r2, int c2) {
    return abs(r1 - r2) + abs(c1 - c2);
}

void printMaze(const vector<vector<string> >& maze, int n, int m) {
    for (int i = 0; i < n; i++) {
        bool printed = false;
        for (int j = 0; j < m; j++) {
            if (maze[i][j] == "") break;
            cout << maze[i][j] << " ";
            printed = true;
        }
        if (printed) cout << "\n";
    }
}

void markPath(vector<vector<string> >& maze,
              vector<vector<Cell> >& parent,
              Cell start, Cell goal)
{
    Cell cur = goal;

    while (!(cur.r == start.r && cur.c == start.c)) {
        Cell p = parent[cur.r][cur.c];
        if (p.r == -1) break;

        if (maze[cur.r][cur.c] == ".")
            maze[cur.r][cur.c] = "o";

        cur = p;
    }
}

int main() {

    ifstream file("data.txt");
    if (!file.is_open()) return 0;

    int n, m;
    file >> n >> m;

    vector<vector<string> > maze(n, vector<string>(m));
    Cell start;
    start.r = -1;
    start.c = -1;
    Cell goal;
    goal.r = -1;
    goal.c = -1;

    int i, j;

    for (i = 0; i < n; i++) {
        for (j = 0; j < m; j++) {
            if (!(file >> maze[i][j])) maze[i][j] = "";

            if (maze[i][j] == "a") {
                start.r = i;
                start.c = j;
            }
            if (maze[i][j] == "b") {
                goal.r = i;
                goal.c = j;
            }
        }
    }

    file.close();

    queue<Cell> q;
    vector<vector<bool> > visited(n, vector<bool>(m, false));
    vector<vector<Cell> > parentBFS(n, vector<Cell>(m, Cell()));

    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++) {
            parentBFS[i][j].r = -1;
            parentBFS[i][j].c = -1;
        }

    long long bfsExpanded = 0;
    long long bfsPushes = 0;

    q.push(start);
    visited[start.r][start.c] = true;
    bfsPushes++;

    while (!q.empty()) {
        Cell cur = q.front();
        q.pop();
        bfsExpanded++;

        if (cur.r == goal.r && cur.c == goal.c)
            break;

        for (int k = 0; k < 4; k++) {
            int nr = cur.r + dr[k];
            int nc = cur.c + dc[k];

            if (nr >= 0 && nr < n && nc >= 0 && nc < m) {

                if (!visited[nr][nc] &&
                    (maze[nr][nc] == "." || maze[nr][nc] == "b"))
                {
                    visited[nr][nc] = true;
                    parentBFS[nr][nc] = cur;
                    q.push(Cell());
                    q.back().r = nr;
                    q.back().c = nc;
                    bfsPushes++;
                }
            }
        }
    }

    vector<vector<string> > mazeBFS = maze;
    markPath(mazeBFS, parentBFS, start, goal);

    priority_queue<AStarNode, vector<AStarNode>, greater<AStarNode> > open;
    vector<vector<bool> > closed(n, vector<bool>(m, false));
    vector<vector<int> > gCost(n, vector<int>(m, 1000000000));
    vector<vector<Cell> > parentAStar(n, vector<Cell>(m, Cell()));

    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++) {
            parentAStar[i][j].r = -1;
            parentAStar[i][j].c = -1;
        }

    long long aStarExpanded = 0;
    long long aStarPushes = 0;

    gCost[start.r][start.c] = 0;

    AStarNode s;
    s.r = start.r;
    s.c = start.c;
    s.g = 0;
    s.h = heuristic(start.r, start.c, goal.r, goal.c);
    s.f = s.g + s.h;
    open.push(s);
    aStarPushes++;

    while (!open.empty()) {

        AStarNode cur = open.top();
        open.pop();

        if (closed[cur.r][cur.c])
            continue;

        closed[cur.r][cur.c] = true;
        aStarExpanded++;

        if (cur.r == goal.r && cur.c == goal.c)
            break;

        for (int k = 0; k < 4; k++) {
            int nr = cur.r + dr[k];
            int nc = cur.c + dc[k];

            if (nr >= 0 && nr < n && nc >= 0 && nc < m) {

                if (maze[nr][nc] == "*" || closed[nr][nc])
                    continue;

                int ng = gCost[cur.r][cur.c] + 1;

                if (ng < gCost[nr][nc]) {
                    gCost[nr][nc] = ng;
                    parentAStar[nr][nc] = Cell();
                    parentAStar[nr][nc].r = cur.r;
                    parentAStar[nr][nc].c = cur.c;

                    AStarNode nxt;
                    nxt.r = nr;
                    nxt.c = nc;
                    nxt.g = ng;
                    nxt.h = heuristic(nr, nc, goal.r, goal.c);
                    nxt.f = nxt.g + nxt.h;

                    open.push(nxt);
                    aStarPushes++;
                }
            }
        }
    }

    vector<vector<string> > mazeAStar = maze;
    markPath(mazeAStar, parentAStar, start, goal);

    cout << "UNSOLVED MAZE\n\n";
    printMaze(maze, n, m);

    cout << "\n\nMAZE SOLVED USING BFS\n\n";
    printMaze(mazeBFS, n, m);

    cout << "\n\nMAZE SOLVED USING A*\n\n";
    printMaze(mazeAStar, n, m);

    cout << "\n\nBFS_EXPANDED " << bfsExpanded << "\n";
    cout << "BFS_PUSHES " << bfsPushes << "\n";
    cout << "ASTAR_EXPANDED " << aStarExpanded << "\n";
    cout << "ASTAR_PUSHES " << aStarPushes << "\n";

    return 0;
}