import type { NextApiRequest, NextApiResponse } from 'next'
import nodemailer from 'nodemailer'

export default async (req: NextApiRequest, res: NextApiResponse) => {
    const eventName = req.body.eventName
    if (eventName === 'order.completed') {
        const items = req.body.content.items.map(item => ({ name: item.name, quantity: item.quantity, id: item.id, image: item.image }))
        const address = req.body.content.user.shippingAddress.fullAddress
        const postalCode = req.body.content.user.shippingAddress.postalCode
        const orderId = req.body.content.token
        const total = req.body.content.finalGrandTotal

        console.log({ items, address, postalCode })
        let transporter = nodemailer.createTransport({
          host: "smtp.gmail.com",
          port: 465,
          secure: true,
          auth: {
            user: process.env.SMTP_EMAIL,
            pass: process.env.SMTP_PASSWORD,
          },
        });

        const mailData = {
            from: process.env.SMTP_EMAIL,
            to: process.env.SEND_NOTIFICATIONS_TO_EMAIL,
            subject: `New order ${orderId}`,
            html: `
            <h1>Items Ordered</h1>
            <ul>
            ${items.map(item => `<li>
                <img src="${item.image}" width="100px" height="100px" >
                <span>${item.quantity} x ${item.name}</span>
                </li>`)}
            </ul>
            <p>Total Price: $${total}</p>
            `
        }

        let output;
        let isError = false
        transporter.sendMail(mailData, (err, info) => {
            if (err) {
                output = err
                isError = true
            } else {
                output = items
            }
        })

        return res.status(isError ? 500 : 200).json(output)
    }

    return res.status(500).json({ status: `Event not supported: ${eventName}` })
}