#include <vector>
#include <map>
#include <iostream>
#include <string>

class Video {
    private:
        std::string video_name_;
        std::string date_creation_;
        int video_length_;
        std::string author_;
    public:
        Video(std::string video_name_, std::string date_creation_,
                int video_length_,
                std::string author_) : video_name_(video_name_), 
                date_creation_(date_creation_),
                video_length_(video_length_),
                author_(author_) {}
};
class MainServer {
    private:
        std::map<std::string, Video> big_map_;
        std::map<
        std::string ip_addr_;
    public:

}