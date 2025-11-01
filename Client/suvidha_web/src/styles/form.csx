.signup-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #f9fafb;
}

.signup-form {
  background: #fff;
  padding: 2rem;
  border-radius: 12px;
  width: 100%;
  max-width: 400px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.signup-form h2 {
  color: #1565c0;
  font-family: 'Poppins', sans-serif;
}

.signup-form input {
  width: 100%;
  padding: 10px;
  margin-top: 12px;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  font-size: 15px;
}

.signup-form button {
  width: 100%;
  background: #1565c0;
  color: white;
  padding: 12px;
  border: none;
  border-radius: 8px;
  margin-top: 16px;
  cursor: pointer;
}

.signup-form button:disabled {
  opacity: 0.6;
}

.error {
  color: #d32f2f;
  margin-top: 8px;
  font-size: 14px;
}

.login-link {
  text-align: center;
  margin-top: 16px;
}
.login-link a {
  color: #1565c0;
  text-decoration: underline;
}
