Engine that simulates youtube web requests and puts videos on different servers (which are in different places)

- Idea, maintain a single server that has all videos with some sort of uuid -> video identification map

- Then, have a series of servers which will have some constraint/cache of available videos

- Then, you will have requests that come through a filter, and it will consist of:
    Request
        Video metadata
        Location

The filter will check where the request has come from and then determine what server is "closest" to the request
Then, check if the video is there
If it is, return video
If it isn't, then make a call to the main server and bring the video on
    - Use LRU cache policy for eviction

Video Class:
    UUID
    name
    author
    length
    date_of_creation

Server Class:
    