// Test file for TypeScript and React highlights in sin.nvim

// Imports (syntax: dark)
import React, { useState, useEffect } from 'react';
import type { User, ApiResponse } from './types';

// Type definitions (syntax: dark)
interface Props {
  name: string;  // property: notable, string: lighter
  age: number;   // property: notable, number: lighter
  isActive: boolean;  // property: notable, boolean: lighter
}

// Enum (syntax: dark)
enum Status {
  Active = 'active',
  Inactive = 'inactive',
}

// Generic type (syntax: dark)
type Result<T> = {
  data: T;
  error: Error | null;
};

// Function with generics (function def: dark, calls: light)
function fetchData<T>(url: string): Promise<T> {
  return fetch(url).then(res => res.json());
}

// React component (syntax elements: dark, data: light)
const UserCard: React.FC<Props> = ({ name, age, isActive }) => {
  // State hook (syntax: dark, values: light)
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState<User | null>(null);

  // Effect hook
  useEffect(() => {
    const loadUser = async () => {
      setLoading(true);
      try {
        const result = await fetchData<User>('/api/user');
        setData(result);
      } catch (error) {
        console.error('Failed to load user:', error);
      } finally {
        setLoading(false);
      }
    };

    loadUser();
  }, []);

  // JSX (tags: dark, content: light)
  return (
    <div className="user-card">
      <h1>{name}</h1>
      <p>Age: {age}</p>
      {loading ? (
        <span>Loading...</span>
      ) : (
        <span>Status: {isActive ? 'Active' : 'Inactive'}</span>
      )}
    </div>
  );
};

// Class with decorator (decorator: accent color - blue)
@injectable()
class UserService {
  private repository: UserRepository;

  constructor(repository: UserRepository) {
    this.repository = repository;
  }

  async getUser(id: string): Promise<User> {
    return this.repository.findById(id);
  }
}

// Type guards (syntax: dark)
function isUser(obj: any): obj is User {
  return obj && typeof obj.name === 'string';
}

// Template literals (data: lighter)
const message = `Hello, ${name}! You are ${age} years old.`;

// Async/await (keywords: dark)
async function main() {
  try {
    const users = await fetchData<User[]>('/api/users');
    console.log(users);
  } catch (error) {
    console.error(error);
  }
}

export default UserCard;