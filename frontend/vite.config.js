const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

useEffect(() => {
  fetch(`${API_BASE_URL}/api/some-endpoint`)
    .then(response => response.json())
    .then(data => {
      // Handle your API data
      console.log(data);
    });
}, []);
