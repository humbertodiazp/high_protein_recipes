import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  markAsRead(event) {
    const notificationId = event.target.dataset.notificationId;

    fetch(`/notifications/${notificationId}/mark_as_read`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Turbo-Frame": "notifications" // Optional Turbo-Frame to refresh
      },
      body: JSON.stringify({}),
    });
  }
}