package com.tju.fast.ocs.schedule;

import java.util.Arrays;

public class MinCostMaxFlow {

    /**
     * MAXV:	最大顶点数 = 最大MSB数量  + 最大时间片数量  + 2
     * MAXE:	最大边数 = 2 * (最大MSB数量  * 最大时间片数量  + 最大MSB数量 + 最大时间片数量 )
     * total:	总边数
     * S:		源点
     * T:		汇点
     * n:		总顶点数
     * head[i]:		起点i邻接的第一条边的终点
     * queue:		当队列用
     * previous[i]:	最短路上，连接到顶点i的上一个点
     * visited[i]:	求最短路时，用来标记顶点i是否访问过
     * InfInteger:	无穷大的int
     * InfDouble:	无穷大的double
     * distance[i]:	源点到顶点i的最短路径
     * edge:		边的集合
     */
    final int MAXV = 2002;
    final int MAXE = 2004000;
    private int total;
    private int S;
    public int T;
    private int n;
    public int[] head = new int[MAXV];
    private int[] queue = new int[MAXV];
    private int[] previous = new int[MAXV];
    private boolean[] visited = new boolean[MAXV];
    final Integer InfInteger = 0xfffffff;
    final Double InfDouble = 99999.0;
    private Double[] distance = new Double[MAXV];
    public Edge[] edge = new Edge[MAXE];

    /**
     * @param s 源点的角标
     * @param t 汇点的角标
     *          初始化网络图
     */
    public void init(int s, int t) {
        this.S = s;
        this.T = t;
        this.n = t + 1;
        Arrays.fill(head, -1);
        this.total = 0;
    }

    /**
     * @param from
     * @param to
     * @param capacity
     * @param cost     新增一条从from指向to，容量为capacity，花费为cost的边
     */
    public void add(int from, int to, int capacity, Double cost) {
        edge[this.total] = new Edge(to, head[from], capacity, cost);
        head[from] = this.total;
        this.total++;
    }

    /**
     * @param from
     * @param to
     * @param capacity
     * @param cost     建图，新增一条边和对应负边
     */
    public void addEdge(int from, int to, int capacity, Double cost) {
        add(from, to, capacity, cost);
        add(to, from, 0, -cost);
    }

    /**
     * @return spfa算法：寻找增广路
     */
    public boolean spfa() {
        int i, front = 0, tail = 1;
        Arrays.fill(distance, InfDouble);
        Arrays.fill(visited, false);
        distance[S] = 0.0;
        queue[0] = S;
        visited[S] = true;
        while (tail != front) {
            int u = queue[front++];
            front %= MAXV;

            for (i = head[u]; i != -1; i = edge[i].getNext()) {
                int v = edge[i].getTo();
                if (edge[i].getCapacity() > 0 && distance[v] > distance[u] + edge[i].getCost()) {
                    distance[v] = distance[u] + edge[i].getCost();
                    previous[v] = i;
                    if (!visited[v]) {
                        visited[v] = true;
                        queue[tail++] = v;
                        tail %= MAXV;
                    }
                }
            }

            visited[u] = false;
        }

        if (distance[T] == InfDouble)
            return false;

        return true;
    }

    /**
     * @param flow
     * @return 增广
     */
    public void end() {
        int u, p, sum = InfInteger;
        for (u = T; u != S; u = edge[p ^ 1].getTo()) {
            p = previous[u];
            sum = Math.min(sum, edge[p].getCapacity());
        }

        for (u = T; u != S; u = edge[p ^ 1].getTo()) {
            p = previous[u];
            edge[p].addCapacity(-sum);
            edge[p ^ 1].addCapacity(sum);
        }
    }

    public void solve() {
        while (spfa()) {        //群钊增广路，并增广
            end();
        }
    }

}
