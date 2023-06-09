ACCESS_TOKEN = "access_token"
PAYLOAD_NAME_SCOPE = "scope"
PAYLOAD_NAME_SUB_ID = "sub_id"
PAYLOAD_NAME_SUB_ROLE_ID = "sub_role_id"
NAME_DIR = 'public'
def generate_img_name_by_key(id: int):
    return f"{id}.jpg"


def generate_file_name_by_key(id: int, filename: str, filtype: str = "portfolio"):
    return f"{id}_{filtype}.{filename.split('.')[-1]}"