#include <iostream>
#include <string>
#include <optional>

typedef struct DOB {
    int month_;
    int day_;
    int year_;
};

typedef struct Address {
    std::optional<std::string> country_;
    std::optional<std::string> state_;
    std::optional<std::string> county_;
    std::optional<std::string> town_;
    std::optional<std::string> street_;

};

typedef struct TimeZone {
    std::string time_zone_;
};

struct Customer {
    std::string name_;
    DOB dob_;
    CardType type_;
    CardBrand brand_;
    std::vector<Subscription> subs_;
    TimeZone tz_;

};