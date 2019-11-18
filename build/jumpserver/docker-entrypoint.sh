#!/bin/bash


cd ${JUMPSERVER_PATH}

CONFIG_FILE=${JUMPSERVER_PATH}/config.yml

if [ ! -f "${CONFIG_FILE}" ]; then
    cp config_example.yml config.yml

    echo "set jumpserver config.yml by env"

    if [ -n "${JUMPSERVER_SECRET_KEY}" ]; then
        sed -i "s/SECRET_KEY:/SECRET_KEY: ${JUMPSERVER_SECRET_KEY}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_BOOTSTRAP_TOKEN}" ]; then
        sed -i "s/BOOTSTRAP_TOKEN:/BOOTSTRAP_TOKEN: ${JUMPSERVER_BOOTSTRAP_TOKEN}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_DEBUG}" ]; then
        sed -i "s/# DEBUG: true/DEBUG: ${JUMPSERVER_DEBUG}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_LOG_LEVEL}" ]; then
        sed -i "s/# LOG_LEVEL: DEBUG/LOG_LEVEL: ${JUMPSERVER_LOG_LEVEL}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_LOG_DIR}" ]; then
        sed -i "s/# LOG_DIR:/LOG_DIR: ${JUMPSERVER_LOG_DIR}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_SESSION_COOKIE_AGE}" ]; then
        sed -i "s/# SESSION_COOKIE_AGE: 86400/SESSION_COOKIE_AGE: ${JUMPSERVER_SESSION_COOKIE_AGE}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_SESSION_EXPIRE_AT_BROWSER_CLOSE}" ]; then
        sed -i "s/# SESSION_EXPIRE_AT_BROWSER_CLOSE: false/SESSION_EXPIRE_AT_BROWSER_CLOSE: ${JUMPSERVER_SESSION_EXPIRE_AT_BROWSER_CLOSE}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_DB_ENGINE}" ]; then
        sed -i "s/DB_ENGINE: mysql/DB_ENGINE: ${JUMPSERVER_DB_ENGINE}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_DB_HOST}" ]; then
        sed -i "s/DB_HOST: 127.0.0.1/DB_HOST: ${JUMPSERVER_DB_HOST}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_DB_PORT}" ]; then
        sed -i "s/DB_PORT: 3306/DB_PORT: ${JUMPSERVER_DB_PORT}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_DB_USER}" ]; then
        sed -i "s/DB_USER: jumpserver/DB_USER: ${JUMPSERVER_DB_USER}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_DB_PASSWORD}" ]; then
        sed -i "s/DB_PASSWORD:/DB_PASSWORD: ${JUMPSERVER_DB_PASSWORD}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_DB_NAME}" ]; then
        sed -i "s/DB_NAME: jumpserver/DB_NAME: ${JUMPSERVER_DB_NAME}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_HTTP_BIND_HOST}" ]; then
        sed -i "s/HTTP_BIND_HOST: 0.0.0.0/HTTP_BIND_HOST: ${JUMPSERVER_HTTP_BIND_HOST}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_HTTP_LISTEN_PORT}" ]; then
        sed -i "s/HTTP_LISTEN_PORT: 8080/HTTP_LISTEN_PORT: ${JUMPSERVER_HTTP_LISTEN_PORT}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_REDIS_HOST}" ]; then
        sed -i "s/REDIS_HOST: 127.0.0.1/REDIS_HOST: ${JUMPSERVER_REDIS_HOST}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_REDIS_PORT}" ]; then
        sed -i "s/REDIS_PORT: 6379/REDIS_PORT: ${JUMPSERVER_REDIS_PORT}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_REDIS_PASSWORD}" ]; then
        sed -i "s/# REDIS_PASSWORD:/REDIS_PASSWORD: ${JUMPSERVER_REDIS_PASSWORD}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_REDIS_DB_CELERY}" ]; then
        sed -i "s/# REDIS_DB_CELERY: 3/REDIS_DB_CELERY: ${JUMPSERVER_REDIS_DB_CELERY}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_REDIS_DB_CACHE}" ]; then
        sed -i "s/# REDIS_DB_CACHE: 4/REDIS_DB_CACHE: ${JUMPSERVER_REDIS_DB_CACHE}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_BASE_SITE_URL}" ]; then
        sed -i "s/# BASE_SITE_URL: http:\/\/localhost:8080/BASE_SITE_URL: ${JUMPSERVER_BASE_SITE_URL}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_AUTH_OPENID}" ]; then
        sed -i "s/# AUTH_OPENID: false/AUTH_OPENID: ${JUMPSERVER_AUTH_OPENID}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_AUTH_OPENID_SERVER_URL}" ]; then
        sed -i "s/# AUTH_OPENID_SERVER_URL: https:\/\/openid-auth-server.com\//AUTH_OPENID_SERVER_URL: ${JUMPSERVER_AUTH_OPENID_SERVER_URL}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_AUTH_OPENID_REALM_NAME}" ]; then
        sed -i "s/# AUTH_OPENID_REALM_NAME: realm-name/AUTH_OPENID_REALM_NAME: ${JUMPSERVER_AUTH_OPENID_REALM_NAME}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_AUTH_OPENID_CLIENT_ID}" ]; then
        sed -i "s/# AUTH_OPENID_CLIENT_ID: client-id/AUTH_OPENID_CLIENT_ID: ${JUMPSERVER_AUTH_OPENID_CLIENT_ID}/g" ${CONFIG_FILE}
    fi
    if [ -n "${JUMPSERVER_AUTH_OPENID_CLIENT_SECRET}" ]; then
        sed -i "s/# AUTH_OPENID_CLIENT_SECRET: client-secret/AUTH_OPENID_CLIENT_SECRET: ${JUMPSERVER_AUTH_OPENID_CLIENT_SECRET}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_OTP_VALID_WINDOW}" ]; then
        sed -i "s/# OTP_VALID_WINDOW: 0/OTP_VALID_WINDOW: ${JUMPSERVER_OTP_VALID_WINDOW}/g" ${CONFIG_FILE}
    fi

    if [ -n "${JUMPSERVER_OTP_ISSUER_NAME}" ]; then
        sed -i "s/# OTP_ISSUER_NAME: Jumpserver/OTP_ISSUER_NAME: ${JUMPSERVER_OTP_ISSUER_NAME}/g" ${CONFIG_FILE}
    fi
else
    echo "set jumpserver config.yml by docker volumes, env JUMPSERVER_* not effect"
fi

/bin/bash -c "source ${OPT_PATH}/${PY_VENV_NAME}/bin/activate && ./jms start"
