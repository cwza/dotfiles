const ll INF = 1e18;
auto dijkstra = [&](int src, vector<ll> &dist) -> void {
    priority_queue<pair<ll,int>, vector<pair<ll,int>>, greater<pair<ll,int>>> pq; // d, u
    dist[src] = 0;
    pq.push({0, src});
    while(pq.size()) {
        auto [d, u] = pq.top();
        pq.pop();
        if(d > dist[u]) continue;
        for(auto [v, w] : adj[u]) {
            if(dist[u] + w < dist[v]) {
                dist[v] = dist[u] + w;
                pq.push({dist[v], v});
            }
        }
    }
};
vector<ll> dist1(n, INF);
dijkstra(0, dist1);

