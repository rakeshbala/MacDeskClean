MacDeskClean
============

Cleans up the desk and moves the cluttered files on desk to a folder on desktop.


Instructions:
Download, open with apple script editor and save as application. On running the script all files on Desktop will be moved to a folder on Desktop:

This is a work in progress. Expect more flexibility later.

Folder structure created and file types included:

"Desk_Bkup_<month>/<day>/<year>" 
  Artifacts & Text - docx, doc, ppt, pptx, xls, xlsx, pdf, txt
  Audio -- aif, iff, m3u, m4a, mid, mp3, mpa, ra, wav, wma, caf, aac, ogg, aiff
  Code and data -- js, plist, json, h, m, c, db, sqlite, sh, css, html, htm, xml, java, jsp, war
  Compressed -- zip, rar, 7z, gz, bz, tar, tgz, gzip
  Images -- png, jpeg, jpg, tiff, bmp, gif, ico
  Videos -- mpeg, mov, m4v, mp4, vob, dat, 3gp, avi, dvx, flv, mkv, mpg, rm, swf, wmv, divx, xvid, ogv
  Others – All others

For eg: Desk_Bkup_9/18/2013
All files will be moved to this folder no matter how many times the script is run during a day.
When date changes a new folder with new name will be created.

test
