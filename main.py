from Application.app import create_app
import Application.statistics as _SAPI

app = create_app()
# Hooks for every request
app.before_request(_SAPI.pre_req)
app.after_request(_SAPI.post_req)

if __name__ == "__main__":
    app.run(debug=True)