vector<vector<ll>> dist(n, vector<ll>(n, INF))
for(int i = 0; i < n; i++) d[i][i] = 0;
for(int i = 0; i < m; i++) {
    int u, v, w;
    cin >> u >> v >> w;
    u--; v--;
    dist[u][v] = min(dist[u][v], ll(w));
    dist[v][u] = min(dist[v][u], ll(w));
}
 
for(int k = 0; k < n; k++) {
    for(int u = 0; u < n; u++) {
        for(int v = 0; v < n; v++) {
            if(dist[u][k] + dist[k][v] < dist[u][v]) {
                dist[u][v] = dist[u][k] + dist[k][v];
            }
        }
    }
}

