long long rng(long long from, long long to) {
    static std::mt19937 gen(
        std::chrono::steady_clock::now().time_since_epoch().count());
    return std::uniform_int_distribution<long long>(from, to)(gen);
}

