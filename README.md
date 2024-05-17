# photo_gallery2

A new Flutter project Using Rest API.

<img src="1.jpg" alt="Alt text" style="width:350px;height:650px;">
<img src="2.jpg" alt="Alt text" style="width:350px;height:650px;">

Explanation:
*Dependencies: The http package is used to fetch data from a REST API.
*Model Class: The Photo class represents the photo data.
*Fetching Data: The fetchPhotos function fetches a list of photos from a REST API endpoint (https://jsonplaceholder.typicode.com/photos).
*UI Structure:
PhotoListScreen fetches and displays the list of photos.
Each list item displays a thumbnail and the photo title.
Tapping on a list item navigates to PhotoDetailScreen, which displays the photo's details.
