-- 3.2)
SELECT g.name
FROM `group` g
LEFT JOIN `groupMembership` gm ON g.id = gm.groupID
WHERE g.name LIKE 'TEST-%'
AND gm.id IS NULL;

-- 3.3)
SELECT u.firstName, u.lastName
FROM `user` u
LEFT JOIN `groupMembership` gm ON u.id = gm.userID
LEFT JOIN `group` g ON gm.groupID = g.id
WHERE u.firstName = 'Victor'
AND (gm.id IS NULL OR g.name NOT LIKE 'TEST-%');

-- 3.4)
SELECT u.firstName, u.lastName, g.name AS groupName
FROM `user` u
JOIN `groupMembership` gm ON u.id = gm.userID
JOIN `group` g ON gm.groupID = g.id
WHERE u.created < g.created;
