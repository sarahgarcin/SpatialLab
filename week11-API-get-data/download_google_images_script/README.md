Google Images Download
---

Python Script for 'searching' and 'downloading' hundreds of Google images/image links!   
Original script from: <https://github.com/hardikvasa/google-images-download>

## Usage 

search_keyword = ['Taj Mahal', 'Pyramid of Giza']

This list is used to search keywords. You can edit this list to search for google images of your choice. You can simply add and remove elements of the list.

keywords = [' high resolution',' paintings',' at night',' from top']

This list is used to further add suffix to your search term. Each element of the list will help you download 100 images. First element is blank which denotes that no suffix is added to the search keyword of the above list. You can edit the list by adding/deleting elements from it.So if the first element of the search_keyword is 'Australia' and the first element of keywords is 'high resolution' as shown above, then it will search for 'Australia High Resolution' images.

## Run the script

In the terminal open the directory containing the script:
`cd path/to/download_google_images_script`
Run the python script
`python google-images-download.py`
The script will create a folder with the name of your research, and download all the images into it. 