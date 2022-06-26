SELECT usr.*
FROM t_device dev WITH(NOLOCK)
INNER JOIN t_user usr WITH(NOLOCK)
    ON usr.device_id = dev.id
    AND usr.wh_id = dev.wh_id