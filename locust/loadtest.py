from locust import HttpUser, task, between

class ProductApiUser(HttpUser):
    wait_time = between(1, 5)  # Wait time between tasks in seconds

    @task
    def get_products(self):
        self.client.get("/products")

    @task
    def get_single_product(self):
        self.client.get("/products/1")

    @task
    def create_product(self):
        self.client.post("/products", json={"id": 0, "name": "Test Product", "price": 99.99})

    @task
    def update_product(self):
        self.client.put("/products/1", json={"id": 1, "name": "Updated Product", "price": 49.99})

    @task
    def delete_product(self):
        self.client.delete("/products/1")