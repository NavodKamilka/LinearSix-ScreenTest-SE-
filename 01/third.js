function projectObject(src, proto) {
    const result = {};

    function project(src, proto, result) {
        for (const key in proto) {
            if (proto.hasOwnProperty(key) && src.hasOwnProperty(key)) {
                if (proto[key] === null && typeof src[key] === 'object') {
                    result[key] = { ...src[key] };
                } else if (typeof proto[key] === 'object' && typeof src[key] === 'object') {
                    result[key] = {};
                    project(src[key], proto[key], result[key]);
                } else {
                    result[key] = src[key];
                }
            }
        }
    }
    project(src, proto, result);
    return result;
}

const src = {
    prop11: {
        prop21: 21,
        prop22: {
            prop31: 31,
            prop32: 32
        }
    },
    prop12: 12
};

const proto = {
    prop11: {
        prop22: null
    }
};

const projected = projectObject(src, proto);
console.log(projected);
