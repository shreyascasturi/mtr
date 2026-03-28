#include "publisher.hpp"

int main() {
    std::cout << "hello world" << std::endl;
    return 1;
}

void spawnThread() {
    std::thread t1{[] () {
        while(true) {}
    }};
    t1.join();
}