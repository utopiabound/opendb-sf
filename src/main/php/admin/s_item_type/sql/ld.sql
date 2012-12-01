#########################################################
# OpenDb 1.5.0b6 'LD' Item Type
#########################################################

#
# Item Type
#
INSERT INTO s_item_type ( s_item_type, description, image ) VALUES ( 'LD', 'Laser Disc', 'ld.gif' );

#
# Item Type Group Relationships
#
INSERT INTO s_item_type_group_rltshp ( s_item_type_group, s_item_type ) VALUES ( 'VIDEO', 'LD' );

#
# Attributes (non-core)
#
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'ALT_ID', 'Alternate Item ID', 'Alt Item ID', 'text', '10', NULL, NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'ALT_TITLE', 'Alternate Title', 'Alternate Title', 'text', '50', NULL, NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'UPC_ID', 'UPC ID', 'UPC ID', 'text', '13', NULL, NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'IMAGEURL', 'Item Image URL', 'Image', 'url', '50', '*', 'IMAGE', NULL, NULL, 'hidden',NULL, NULL, NULL, NULL, NULL, 'N', 'Y', 'N', 'N', 'IMAGE', NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'IMAGEURLB', 'Back Image URL', 'Back Image', 'url', '50', '*', 'IMAGE', NULL, NULL, 'hidden',NULL, NULL, NULL, NULL, NULL, 'N', 'Y', 'N', 'N', 'IMAGE', NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'IMDBRATING', 'IMDB User Rating', 'IMDB Rating', 'hidden', NULL, NULL, NULL, NULL, NULL, 'star_rating','10', '%starrating% %value%/%maxrange%', NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'MOVIE_PLOT', 'Plot of a Movie', 'Plot', 'textarea', '50', '5', NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'EPISODES', 'Episodes', 'Episode(s)', 'text', '50', NULL, NULL, NULL, NULL, 'display','%display%', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'DIRECTOR', 'Director of a Movie', 'Director(s)', 'text', '50', NULL, NULL, NULL, NULL, 'list','names', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'EXPRODUCER', 'Executive Producer(s) of a media', 'Executive Producer(s)', 'text', '50', NULL, NULL, NULL, NULL, 'list','names', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'PRODUCER', 'Producer(s) of a media', 'Producer(s)', 'text', '50', NULL, NULL, NULL, NULL, 'list','names', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'WRITER', 'The Writer(s) of a media', 'Writer(s)', 'text', '50', NULL, NULL, NULL, NULL, 'list','names', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'COMPOSER', 'Music Composer(s)', 'Composer(s)', 'text', '50', NULL, NULL, NULL, NULL, 'list','names', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'ACTORS', 'List of Actors in a movie', 'Actor(s)', 'text', '50', NULL, NULL, NULL, NULL, 'list','names', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'Y', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'MOVIEGENRE', 'Movie Genre', 'Genre', 'checkbox_grid', '%display%', 'VERTICAL', NULL, NULL, NULL, 'category','%display%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', 'CATEGORY', NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'YEAR', 'Year of Release', 'Year', 'number', '4', NULL, NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'RUN_TIME', 'Running time', 'Length (minutes)', 'number', '4', NULL, NULL, NULL, NULL, 'format_mins','%h %H %m %M', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'AUDIO_LANG', 'Audio Languages', 'Audio Language(s)', 'checkbox_grid', '%img% %display%', 'VERTICAL', NULL, NULL, NULL, 'display','%img% %display%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'AUDIO_XTRA', 'Additional Audio Tracks', 'Additional Audio', 'checkbox_grid', '%img% %display%', 'VERTICAL', NULL, NULL, NULL, 'display','%img% %display%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'SUBTITLES', 'Subtitle languages', 'Subtitles', 'checkbox_grid', '%img% %display%', 'VERTICAL', NULL, NULL, NULL, 'display','%img% %display%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'SUBS_XTRA', 'Extra Subtitle types', 'Additional Subtitle(s)', 'checkbox_grid', NULL, NULL, NULL, NULL, NULL, 'display','%img% %display%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'AGE_RATING', 'Age Recommendation', 'Age', 'radio_grid', '%img% %display%', NULL, NULL, NULL, NULL, 'display','%img%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'RATIO', 'Aspect Ratio of Movie', 'Aspect Ratio(s)', 'checkbox_grid', '%value%', 'VERTICAL', NULL, NULL, NULL, 'display','%display%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'VID_FORMAT', 'Encoding Format of Video', 'Video Format', 'single_select', '%value%', NULL, NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'Y', 'N', 'Y', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'NO_MEDIA', 'Records no of Media', 'Number of Media', 'number', '3', NULL, NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 'N', NULL, NULL);
INSERT INTO s_attribute_type ( s_attribute_type, description, prompt, input_type, input_type_arg1, input_type_arg2, input_type_arg3, input_type_arg4, input_type_arg5, display_type, display_type_arg1, display_type_arg2, display_type_arg3, display_type_arg4, display_type_arg5, listing_link_ind, file_attribute_ind, lookup_attribute_ind, multi_attribute_ind, s_field_type, site_type ) VALUES ( 'COMMENTS', 'Extra Comments', 'Comments', 'textarea', '50', '5', NULL, NULL, NULL, 'display','%value%', NULL, NULL, NULL, NULL, 'N', 'N', 'N', 'N', NULL, NULL);

#
# Item Attribute Relationships
#
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'S_ITEM_ID', 0, NULL, 'N', 'N', 'N', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'S_TITLE', 1, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'ALT_ID', 2, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'ALT_TITLE', 2, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'UPC_ID', 3, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'IMAGEURL', 4, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'IMAGEURLB', 5, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'IMDBRATING', 5, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'MOVIE_PLOT', 10, NULL, 'N', 'N', 'Y', 'Y' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'EPISODES', 15, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'DIRECTOR', 20, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'EXPRODUCER', 22, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'PRODUCER', 25, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'WRITER', 27, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'COMPOSER', 28, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'ACTORS', 30, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'MOVIEGENRE', 40, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'YEAR', 50, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'RUN_TIME', 60, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'AUDIO_LANG', 70, NULL, 'N', 'N', 'N', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'AUDIO_XTRA', 75, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'SUBTITLES', 80, NULL, 'N', 'N', 'N', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'SUBS_XTRA', 81, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'AGE_RATING', 90, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'RATIO', 100, NULL, 'N', 'N', 'N', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'VID_FORMAT', 110, NULL, 'N', 'N', 'N', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'NO_MEDIA', 115, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'COMMENTS', 120, NULL, 'N', 'N', 'N', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'S_STATUS', 253, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'S_STATCMNT', 254, NULL, 'N', 'N', 'Y', 'N' );
INSERT INTO s_item_attribute_type ( s_item_type, s_attribute_type, order_no, prompt, instance_attribute_ind, compulsory_ind, printable_ind, rss_ind ) VALUES ( 'LD', 'S_DURATION', 255, NULL, 'N', 'N', 'Y', 'N' );

#
# Attribute Type Lookup (MOVIEGENRE)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Action', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Adult', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Adventure', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Animation', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Audio', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Biblical', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Comedy', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Compilation', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Documentary', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Drama', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Fantasy', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Holiday', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Horror', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Music', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Musical', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Mystery', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Other', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Parody', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Romance', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'ScienceFiction', 'Science Fiction', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Sports', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Superhero', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Suspense', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Television', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Thriller', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'War', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'MOVIEGENRE', NULL, 'Western', '', '', 'N' );

#
# Attribute Type Lookup (AUDIO_LANG)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_LANG', NULL, 'ENGLISH', 'English', 'usa.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_LANG', NULL, 'FINNISH', 'Finnish', 'finnish.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_LANG', NULL, 'FRENCH', 'French', 'french.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_LANG', NULL, 'GERMAN', 'German', 'german.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_LANG', NULL, 'ITALIAN', 'Italian', 'italian.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_LANG', NULL, 'SPANISH', 'Spanish', 'spanish.gif', 'N' );

#
# Attribute Type Lookup (AUDIO_XTRA)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_XTRA', 0, 'SOUNDTRACK', 'Soundtrack Only', 'director.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_XTRA', 1, 'ACT_COMMENT', 'Actor\'s Commentary', 'director.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_XTRA', 2, 'DIR_COMMENT', 'Director\'s Commentary', 'director.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_XTRA', 3, 'PROD_COMMENT', 'Producer\'s Commentary', 'director.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AUDIO_XTRA', 4, 'OTHER_COMMENT', 'Other Commentary', 'director.gif', 'N' );

#
# Attribute Type Lookup (SUBTITLES)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBTITLES', NULL, 'ENGLISH', 'English', 'usa.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBTITLES', NULL, 'ENG_H_IMP', 'English (Hearing Impaired)', 'english.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBTITLES', NULL, 'FRENCH', 'French', 'french.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBTITLES', NULL, 'GERMAN', 'German', 'german.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBTITLES', NULL, 'ITALIAN', 'Italian', 'italian.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBTITLES', NULL, 'SPANISH', 'Spanish', 'spanish.gif', 'N' );

#
# Attribute Type Lookup (SUBS_XTRA)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBS_XTRA', 0, 'COMMENTARY', 'Commentary', 'director.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'SUBS_XTRA', 0, 'TRIVIA', 'Trivia', 'director.gif', 'N' );

#
# Attribute Type Lookup (AGE_RATING)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 0, 'G', 'General Audiences', 'G.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 1, 'PG', 'Parental Guidance Suggested (6+)', 'PG.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 2, 'M', 'Mature Audience Recommended', 'M.gif', 'Y' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 2, 'PG-13', 'Parental Guidance Strongly Cautioned (13+)', 'PG-13.gif', 'Y' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 3, 'MA', 'Mature Audience', 'MA.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 3, 'R', 'Restricted Audience (17+)', 'R.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 4, 'NC-17', 'No Admittance 17 and under', 'NC-17.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 5, 'X', 'Explicit Sexual Content', 'X.gif', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'AGE_RATING', 6, 'NR', 'Unrated Content', 'NR.gif', 'N' );

#
# Attribute Type Lookup (RATIO)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '1.33', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '1.78', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '1.85', '', '', 'Y' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '2.20', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '2.35', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '2.40', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'RATIO', NULL, '2.78', '', '', 'N' );

#
# Attribute Type Lookup (VID_FORMAT)
#
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'VID_FORMAT', NULL, 'NTSC', '', '', 'Y' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'VID_FORMAT', NULL, 'PAL', '', '', 'N' );
INSERT INTO s_attribute_type_lookup ( s_attribute_type, order_no, value, display, img, checked_ind ) VALUES ( 'VID_FORMAT', NULL, 'SECAM', '', '', 'N' );
