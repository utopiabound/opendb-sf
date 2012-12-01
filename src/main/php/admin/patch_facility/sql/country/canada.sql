##############################################################
# Formatted for Canada - with Canadian Motion Picture Distributors Association (CMPDA)
##############################################################

#
# Customize default region for country
#
UPDATE s_attribute_type_lookup
SET checked_ind = NULL
WHERE s_attribute_type = 'DVD_REGION';

UPDATE s_attribute_type_lookup
SET checked_ind = 'Y'
WHERE s_attribute_type = 'DVD_REGION' 
AND value = '1';

UPDATE `s_attribute_type_lookup`
SET checked_ind = NULL
WHERE s_attribute_type = 'GAMEREGION';

UPDATE `s_attribute_type_lookup`
SET checked_ind = 'Y'
WHERE s_attribute_type = 'GAMEREGION'
AND value = 'CA';

#
# Customize default video format for country
#
UPDATE s_attribute_type_lookup
SET checked_ind = NULL
WHERE s_attribute_type = 'VID_FORMAT';

UPDATE s_attribute_type_lookup
SET checked_ind = 'Y'
WHERE s_attribute_type = 'VID_FORMAT' 
AND value = 'NTSC';

#
# Use British flag for all English values
# 
UPDATE s_attribute_type_lookup SET img = 'english.gif'
WHERE s_attribute_type = 'AUDIO_LANG' AND value IN ('ENGLISH', 'ENGLISH_SR', 'ENGLISH_2.0');

UPDATE s_attribute_type_lookup SET img = 'english.gif'
WHERE s_attribute_type = 'SUBTITLES' AND value  = 'ENGLISH';

#
# Customize ratings for country
#
DELETE FROM s_attribute_type_lookup WHERE s_attribute_type = 'AGE_RATING';
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', 'G', 'General (Suitable for all ages)', 'G.gif', NULL, '0');
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', 'PG', 'Parental Guidance Suggested', 'PG.gif', NULL, '1');
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', '14A', 'Parental Accompaniment (14+)', '14A.gif', 'Y', '2');
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', '18A', 'Parental Accompaniment (18+)', '18A.gif', NULL, '3');
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', 'R', 'Restricted (18+)', 'R.gif', NULL, '4');
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', 'X', 'Explicit Sexual Content (18+)', 'X.gif', NULL, '5');
INSERT INTO s_attribute_type_lookup (s_attribute_type, value, display, img, checked_ind, order_no) VALUES ( 'AGE_RATING', 'NR', 'Unrated Content', 'NR.gif', NULL, '6');
