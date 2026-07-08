type DayInt = int | None
type DayOutput = int | str


def days_to_seconds(days: DayInt) -> DayOutput : 
    if (days is not None):
        seconds_in_a_day : int = 86400
        return days * seconds_in_a_day
    else:
        return "days supplied is incorrect."


def input_to_DayInt(days_to_transform : str) -> DayInt:
    try:
        return int(days_to_transform.strip())
    except ValueError:
        print(f"Value error raised, input is incorrect: {days_to_transform}")
        print("Will return None rather than an int")
        return None

if __name__ == "__main__":
    days_to_transform : str = input("how many days do you want to transform? ")
    day_int : DayInt = input_to_DayInt(days_to_transform)
    seconds_amt : DayOutput = days_to_seconds(day_int)
    print(f"days to transform: {days_to_transform} | amt of seconds: {seconds_amt}")

