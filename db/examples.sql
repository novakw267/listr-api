insert into lists
         (title,             hidden, created_at, updated_at)
  values
         ('Favorite Things', false,  NOW(),      NOW()),
         ('Todo',            false,  NOW(),      NOW());

insert into items
         (text,           done,  created_at, updated_at, list_id)
  values
         ('Cats',         false, NOW(),      NOW(),      1),
         ('Star Wars',    false, NOW(),      NOW(),      1),
         ('Coffee',       false, NOW(),      NOW(),      1),
         ('Keith Hulu',   false, NOW(),      NOW(),      1),
         ('Sleep',        false, NOW(),      NOW(),      1),

         ('Build an API', false, NOW(),      NOW(),      2),
         ('Sleep',        false, NOW(),      NOW(),      2);
